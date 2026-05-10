# CISG110-Final
## Devlogs
### Week 12
A technical issue I encountered was having both left kick and right kick go off at the same time. I looked at what was being printed in the output to investigate this issue. I solved it by looking at the signal functions, and realizing I had right kick and left kick connected to the same signal.

### Week 13
A technical issue I encountered was figuring out how to make the rat explode after it came in contact with the player. I referenced the prop script to help me investigate this. I figured out how to do this by referencing the video and looking at how the prop script functioned.

### Week 14
A technical issue I encountered was trying to get my player to play the kick animation, instead of continuing to idle or walk. I solved it by rewatching the video, trying different if statements that checked things like the KICK_TIMER, and adjusting the MAX_KICK_TIME. I was able to set the MAX_KICK_TIME to the exact duration of the kick animation by using the formula 1 / (frames per second) * (max frames). I stopped the other animations from interrupting my kick animation by adding to their if statements a check to see if the KICK_TIMER is <= 0.

### Week 15
Put your Week 15 Devlog answer here.

## Open-Source Assets
- [Ninja cat sprites](https://opengameart.org/content/cat-fighter-sprite-sheet)
- [Item sprites](https://ipixl.itch.io/pixel-art-items-part-1)
- [Interior tilesets](https://rcpstd.itch.io/interior-tileset-asset-pack-16x16)
- [Rat sprites](https://carysaurus.itch.io/rat-sprites)