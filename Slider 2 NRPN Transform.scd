// Window

(
~gui = Window.new(\gui_test, Rect(200, 50, 195, 200)); // Creates a window with a slider
~slider = Slider.new(~gui, Rect(80,15,30,175));
~gui.front;
)

// Global Variables

(
// assigns the maximum value the slider-data gets transformed into. Ex: The cutoff pot on a Prophet Rev2 only has a maximum of 164 steps, 0-163. (MSB: 1,  LSB: 35)
~scale = 16383; 

// creates arrays for the split data to get stored into
 
~sliderMSB = []; // Most significant byte
~sliderLSB = []; // Least significant byte
)

// Slider action function

(
~slider.action_({ // Transforms the slider output to something useful
	arg obj;
	var sliderNamn = "value_1";
	sliderNamn.postln; // posts an identifying string.
	~sliderMSB = ((obj.value*~scale) / 128).trunc(1); // counts multiples of 128, truncates to absolute numbers
	~sliderLSB = (obj.value*~scale).round % 128; // counts the modulo, the between-the-steps of the ~sliderMSB.
});
)

// Postln Task TODO: MIDIOut Message implemetation

(
~guiTask = Task({ // Using Task to print the output from the slider action function.

	inf.do({
		var postValues = [];
		postValues = "MSB: " ++ ~sliderMSB.asInteger.asString ++ "  " ++ "LSB: " ++ ~sliderLSB.asInteger.asString;
		// fetches the data and prints to the post-window.
		postValues.postln;
		0.001.wait // Update time

		/*
		WRITE CONTINOUS MIDIOut MESSAGE HERE
		*/

		// TODO: write if-statement to prevent updating when values are not changing.
	})
})
)

~guiTask.play; // Runs task.
