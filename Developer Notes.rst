Known Bugs::

	If the script is run manually more often than once a minute, it will use the pre-generated image that it had just created, so the clock will show one minute ahead
		No matter how many times you run it, it should only be a maximum of 1 minute ahead - the problem doesn't get compounded
		It resolves itself after a minute - once it catches up, it'll resync
		If I want to fix it, I should have a way to verify that a pre-gen.png file is actually set at the right time before using it
			The only way I can think of is png metadata
				Basically, when I create a pre-gen.png file, label it with the hour, minute, day, and month in metadata
				Then before I load it, figure out the current hour, minute day and month, and compare it to the pre_gen.png file