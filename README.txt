+======================+
|   Nano Processor     |
|  Implementation Guide|
|    By Group 44       |
+======================+

Welcome to the Nano Processor Implementation Guide by Group 44. Here, we offer straightforward instructions to help you make the most of our technology:

--------------------

1. **Simple Instructions:** Our Nano Processor uses short, clear instructions. Each instruction is only 13 bits long, with 3 bits reserved for its Op Code. There are eight different instructions to choose from.

2. **Ending a Program:** When you use the END instruction, your program stops. Once you've reached this point, you can't restart the program. It's like reaching the end of a road.

3. **Flags for Information:** We've included four flags to give you extra information about the R7 register. Checking these flags at the end of your program can help you understand what's happened during processing.

4. **Resetting the Device:** Before you start a new program, it's a good idea to reset the device. This clears out any old data from previous programs, so you start with a clean slate.

5. **Visual Feedback:** You can see the current value of the R7 register in binary using four LEDs. Additionally, a seven-segment display shows the value in hexadecimal. These visuals help you track what's happening inside the processor.

6. **Data Representation:** Our processor works with 4-bit numbers. If you're dealing with positive numbers, you can use all four bits. But for negative numbers, you'll have to give up one bit for the sign, leaving you with only three bits for the actual number.

7. **Using the Seven-Segment Display:** To show a value on the seven-segment display, you need to store it in the R7 register first. Think of it like loading a movie onto a projector before you can watch it on the big screen.

8. **Clock Speed:** The speed of our processor's internal clock depends on the board you're using. For the Basys3 board, we've set it to a specific speed to make sure everything runs smoothly.

--------------------

With these simple guidelines, you can unlock the full potential of the Nano Processor, brought to you by Group 44. If you have any questions, feel free to reach out. Happy processing!
