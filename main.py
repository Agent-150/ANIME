import asyncio
from main.modules.parser import auto_parser
from main import app
from pyrogram import filters, idle
from pyrogram.types import Message
from uvloop import install
from main.modules.tg_handler import tg_handler

loop = asyncio.get_event_loop()

@app.on_message(filters.command(["start","help","ping"]))
async def start(bot, message: Message):
    return await message.reply_text("⭐️ **Bot Is Online...**\n\n**Updates :** @TechZBots **| Support :** @TechZBots_Support")

async def start_bot():
    print("==================================")
    print("[INFO]: AutoAnimeBot Started Bot Successfully")
    print("==========JOIN @TECHZBOTS=========")

    print("[INFO]: Adding Parsing Task")
    asyncio.ensure_future(auto_parser())
    asyncio.ensure_future(tg_handler())

    await idle()

if __name__ == "__main__":
    install()
    try:
        loop.run_until_complete(start_bot())
    except KeyboardInterrupt:
        pass
    finally:
        loop.run_until_complete(asyncio.gather(*asyncio.all_tasks()))
        loop.close()
