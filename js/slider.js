﻿    
    $(function () {
        $("#slide").Morphext({
            // The [in] animation type. Refer to Animate.css for a list of available animations.
            animation: "fadeInDown",
            // An array of phrases to rotate are created based on this separator. Change it if you wish to separate the phrases differently (e.g. So Simple | Very Doge | Much Wow | Such Cool).
            separator: ",",
            // The delay between the changing of each phrase in milliseconds.
            speed: 4000,
            complete: function () {
                // Called after the entrance animation is executed.
                animated: "fadeOutRight";
            }
        });

        $("#slide1").Morphext({
            // The [in] animation type. Refer to Animate.css for a list of available animations.
            animation: "fadeInUp",
            // An array of phrases to rotate are created based on this separator. Change it if you wish to separate the phrases differently (e.g. So Simple | Very Doge | Much Wow | Such Cool).
            separator: ",",
            // The delay between the changing of each phrase in milliseconds.
            speed: 4000,
            complete: function () {
                // Called after the entrance animation is executed.
                animated: "fadeIn";
            }
        });
    });
   