import sounddevice as sd
import asyncio
import numpy as np
from deepgram import Deepgram
import os
import json

# Initialize Deepgram API client
DEEPGRAM_API_KEY = "2de3e9345d70fc5f096c62a924744275a4920e67"  # Replace with your Deepgram API key
dg_client = Deepgram(DEEPGRAM_API_KEY)

# Configuration
sample_rate = 16000  # Deepgram requires 16 kHz sample rate
channels = 1  # Mono audio
chunk_duration = 5  # Duration of audio chunks (in seconds)

# Queue to hold audio data
audio_queue = asyncio.Queue()

async def transcribe_audio():
    """
    Streams audio data to Deepgram for real-time transcription.
    """
    print("Connecting to Deepgram...")
    url = "wss://api.deepgram.com/v1/listen"
    headers = {"Authorization": f"Token {DEEPGRAM_API_KEY}"}

    async with dg_client.transcription.live(
        audio=audio_stream_generator(),
        model="general",
        punctuate=True,
        interim_results=True
    ) as response:
        print("Connected to Deepgram. Transcribing...")
        async for transcription in response:
            if "channel" in transcription and "alternatives" in transcription["channel"]["alternatives"][0]:
                result = transcription["channel"]["alternatives"][0]["transcript"]
                if result:
                    print(f"Real-time Transcription: {result}")

async def audio_stream_generator():
    """
    Asynchronous generator that yields audio chunks from the queue.
    """
    while True:
        audio_chunk = await audio_queue.get()
        yield audio_chunk
        audio_queue.task_done()

def audio_callback(indata, frames, time, status):
    """
    Called by sounddevice for each audio chunk. Pushes audio data to the queue.
    """
    if status:
        print(f"Audio callback status: {status}")
    # Add audio data to the queue
    audio_data = indata.tobytes()
    asyncio.run_coroutine_threadsafe(audio_queue.put(audio_data), asyncio.get_running_loop())

async def main():
    """
    Main function to initialize audio stream and transcription.
    """
    print("Setting up audio stream...")
    with sd.InputStream(samplerate=sample_rate, channels=channels, callback=audio_callback):
        print("Recording... Press Ctrl+C to stop.")
        try:
            await transcribe_audio()
        except KeyboardInterrupt:
            print("\nRecording stopped.")

if __name__ == "__main__":
    asyncio.run(main())
