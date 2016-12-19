var plays = 0;
var end = 0;
var pause = 0;
var ends = 0;

// USED FUNCTIONS
// are below 

function playCounter(file) {
        // counting plays
        plays = plays + 1;
        
        // storing data as a javascript array 
        info = [file, plays];
        
        // sending javascript objects to file 
        Shiny.onInputChange('plays_r', info);
        
        // sending to console;
        console.log("playCounter File");
}

function pauseCounter(file) {
        // Counting the number of pauses
        pause = pause + 1;
        
        // storing data as a javascript array 
        info = [file, pause];
        
        // 
        Shiny.onInputChange('pause_r', info);
        
        // sending to console;
        console.log("pauseCounter File");
}

function endCounter(file) {
        // Counting the number of pauses
        ends = ends + 1;
        
        // storing data as a javascript array 
        info = [file, ends];
        
        // 
        Shiny.onInputChange('ends_r', info);
        
        // sending to console;
        console.log("endCounter File");
}

// note, unsure if functions follow JS best practices 
//


// UNUSED FUNCTIONS
//
//
//
// unused functions are below this line
//
//

function endCounter() {
        // Counting the number of time the audio file ended

        end = end + 1;
        alert(end);
}



function endCounter() {
        ends = ends + 1;
        alert(ends);
}
