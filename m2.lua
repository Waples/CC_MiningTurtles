--[[

    Chunk Miner for CC:Tweaked in Lapito's Galacticraft

    Version: v0.1

    Arguments:
    - Z (aka Depth): Set mining depth for mining turtle.

    Steps defined:
    - check block-type:
        - if breakable and not on blacklist:
            - break block, check if you can move.
    - move to x / y while breaking blocks, then go down one in z cords
    - if gravel/sand:
        - break block but don't move until free to move again.
    - if lava:
        - grab lava with bucket and refuel.

]]--

--[[

CHUNK = tonumber(arg[1])
DEPTH = tonumber(arg[2])
OFFSET_2 = (CHUNK/(CHUNK/2))
OFFSET = (CHUNK/2)

]]--

CHUNK = 16
DEPTH = tonumber(arg[1])
OFFSET = 2

print("[Welcome to Chunk Miner v0.1]")
print("> Coded by Waples_\n")

function bootup()
    turtle.refuel()
    print("Fuel Level: " ..turtle.getFuelLevel().. ".")
    print("Digging a Quarry of " ..CHUNK.."x"..CHUNK.. " in size.\n")
    print("Set depth: " ..DEPTH.. ".")
end



function miningSeq()
    turtle.digDown()

    -- Dig straight forward until end of chunk and turn around corner
    for i = OFFSET, CHUNK do
        turtle.digDown()
        turtle.forward()
    end
    turtle.digDown()
    turtle.turnRight()
    turtle.forward()
    turtle.turnRight()

    -- Next loop until end of chunk
    turtle.digDown()
    for i = OFFSET, CHUNK do
        turtle.digDown()
        turtle.forward()
    end
    -- Clear out next block
    turtle.digDown()
end


function main()

    for i = 1, CHUNK do
        print("Round: " ..i.. " off " ..CHUNK)
        for j = 1, (CHUNK/2) do
            print("Loop: " ..j.. " out of " ..(CHUNK/2).. ".")
            print("Starting mining sequence")
            miningSeq()
            turtle.turnLeft()
            turtle.forward()
            turtle.turnLeft()
        end
        print("Turning 180 Degrees")
        turtle.turnLeft()
        turtle.turnLeft()
    end



    print("wtf?")


    for i = 1, (CHUNK/2) do
        print("Shuffle Shuffle")
        turtle.forward()
    end

    turtle.turnRight()
    turtle.down()
    distanceFromChest = distanceFromChest + 1
    print("Current depth: " ..distanceFromChest.. ".")
end


-- Set some initial values
distanceFromChest = 0

-- Run the bootup function
bootup()

-- MAIN LOOP
-- for `DEPTH`, run main loop..
for i = 1, DEPTH do
    main()
end

-- FINALLY
-- return to surface
for i = 1, distanceFromChest do
    turtle.up()
end