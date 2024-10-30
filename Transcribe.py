import torch
import numpy as np
import sounddevice as sd
import soundfile as sf
from transformers import Wav2Vec2ForCTC, Wav2Vec2Processor, pipeline

# Load Wav2Vec2 model and processor for real-time transcription
device = "cuda" if torch.cuda.is_available() else "cpu"
wav2vec2_model = Wav2Vec2ForCTC.from_pretrained("facebook/wav2vec2-large-960h").to(device)
wav2vec2_processor = Wav2Vec2Processor.from_pretrained("facebook/wav2vec2-large-960h")

# Initialize Whisper model for file transcription
whisper_pipe = pipeline(
    "automatic-speech-recognition",
    model="openai/whisper-small",
    chunk_length_s=30,
    device=device,
)

# Audio capture parameters for real-time transcription
sample_rate = 16000
channels = 1
chunk_duration = 5
frames_per_buffer = 1024
audio_buffer = np.zeros(0, dtype=np.float32)

# Microphone audio callback function
def audio_callback(indata, frames, time, status):
    global audio_buffer
    if status:
        print(status)

    audio_chunk = indata[:, 0].astype(np.float32)
    audio_buffer = np.append(audio_buffer, audio_chunk)

    if len(audio_buffer) >= sample_rate * chunk_duration:
        input_values = wav2vec2_processor(audio_buffer[:sample_rate * chunk_duration], sampling_rate=sample_rate, return_tensors="pt").input_values.to(device)
        with torch.no_grad():
            logits = wav2vec2_model(input_values).logits
            predicted_ids = torch.argmax(logits, dim=-1)
            transcription = wav2vec2_processor.batch_decode(predicted_ids)[0]
            print(f"Real-time Transcription: {transcription}")

        audio_buffer = audio_buffer[sample_rate * chunk_duration:]

# Real-time transcription with exit handling
def real_time_transcription():
    devices = sd.query_devices()
    print("Available audio devices:", devices)
    input_device_index = 0 if devices else None
    if input_device_index is None:
        print("No audio input devices found.")
        return

    try:
        with sd.InputStream(samplerate=sample_rate, channels=channels,
                            callback=audio_callback, blocksize=frames_per_buffer,
                            device=input_device_index):
            print("Recording... Press Ctrl+C to stop.")
            while True:
                pass
    except KeyboardInterrupt:
        print("\nRecording stopped by user.")
    except sd.PortAudioError as e:
        print(f"Error opening audio stream: {e}")

# File-based transcription
def file_transcription(file_path):
    try:
        audio_data, file_sample_rate = sf.read(file_path, dtype='float32')
        if file_sample_rate != sample_rate:
            raise ValueError("Audio file sample rate must be 16kHz")

        result = whisper_pipe({"array": audio_data, "sampling_rate": file_sample_rate})["text"]
        print(f"File Transcription: {result}")
    except Exception as e:
        print(f"Error loading or transcribing audio file: {e}")

# Main program
def main():
    print("Select an option:")
    print("1: Transcribe from microphone (real-time)")
    print("2: Transcribe from an audio file")
    choice = input("Enter your choice (1 or 2): ")

    if choice == "1":
        real_time_transcription()
    elif choice == "2":
        file_path = input("Enter the path to the audio file: ")
        file_transcription(file_path)
    else:
        print("Invalid choice. Please select 1 or 2.")

if __name__ == "__main__":
    main()
