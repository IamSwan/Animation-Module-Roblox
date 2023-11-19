# How to install:

    - First go in StarterPlayer -> StarterCharacterScripts
    - Create a modulescript then paste the code.
    - Fill in the animation table with your own animations.

# How to use:
    There are multiple things you can do with this module.

    - module:PlayAnimation(animationName, fadeTime)
    Allows to play the said animation if it exist

    - module:StopAnimation(animationName, fadeTime)
    allows you to stop the animation from anywhere

    -module.GetTrack(animationName)
    allows you to get the AnimationTrack instance of your animation

    -module:StopAllAnims(fadeTime)
    allows you to stop all currently playing animations.

# Why use it:
    This module not only allows you to have a simplier approach on how to play animations,
    it also allows you to manipulate your animations from anywhere,
    offering the possibility to stop, play,
    or even get the track's informations from
    other scripts than the one you originally created it into.
