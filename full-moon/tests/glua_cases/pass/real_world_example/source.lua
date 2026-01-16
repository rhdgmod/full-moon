// Real-world GLua example
// Simulates a typical Garry's Mod addon script

/*
    Player Health System
    Manages player health, damage, and healing
*/

// Global configuration
local MAX_HEALTH = 100
local MIN_HEALTH = 0
local REGEN_RATE = 5
local REGEN_DELAY = 3

/* Player class */
local Player = {}
Player.__index = Player

function Player:Create(name)
    local self = setmetatable({}, Player)
    self.name = name
    self.health = MAX_HEALTH
    self.lastDamageTime = 0
    self.isDead = false
    return self
end

// Damage handling
function Player:TakeDamage(amount)
    /* Skip if already dead or invalid damage */
    if self.isDead || amount <= 0 then
        return false
    end

    self.health = self.health - amount
    self.lastDamageTime = CurTime()

    // Check if player died
    if self.health <= MIN_HEALTH then
        self.health = 0
        self.isDead = true
        self:OnDeath()
        return true
    end

    return true
end

/* Healing function */
function Player:Heal(amount)
    if self.isDead || amount <= 0 then
        return false
    end

    self.health = self.health + amount

    // Cap at max health
    if self.health > MAX_HEALTH then
        self.health = MAX_HEALTH
    end

    return true
end

// Regeneration system
function Player:Think()
    /* Skip regeneration if dead or recently damaged */
    if self.isDead then
        return
    end

    local timeSinceDamage = CurTime() - self.lastDamageTime

    // Natural regeneration after delay
    if timeSinceDamage >= REGEN_DELAY && self.health < MAX_HEALTH then
        self:Heal(REGEN_RATE * FrameTime())
    end
end

function Player:OnDeath()
    print(self.name .. " has died!")
    // Additional death handling here
end

/* Respawn system */
function Player:Respawn()
    if !self.isDead then
        return false
    end

    self.health = MAX_HEALTH
    self.isDead = false
    self.lastDamageTime = 0
    return true
end

// Status checks
function Player:IsAlive()
    return !self.isDead && self.health > 0
end

function Player:GetHealthPercent()
    return (self.health / MAX_HEALTH) * 100
end

/* Main game loop simulation */
local players = {}

function InitializePlayers()
    for i = 1, 10 do
        local player = Player:Create("Player" .. i)
        table.insert(players, player)
    end
end

// Update all players
function UpdatePlayers()
    for i, player in ipairs(players) do
        // Skip invalid players
        if player == nil then
            continue
        end

        player:Think()

        /* Debug output for low health players */
        if player:IsAlive() && player:GetHealthPercent() < 25 then
            print(player.name .. " is low on health!")
        end
    end
end

// Combat simulation
function SimulateCombat()
    for i = 1, 100 do
        // Pick random players
        local attacker = players[math.random(#players)]
        local victim = players[math.random(#players)]

        /* Skip if same player or either is dead */
        if attacker == victim || !attacker:IsAlive() || !victim:IsAlive() then
            continue
        end

        // Apply damage
        local damage = math.random(10, 30)
        victim:TakeDamage(damage)

        // Check for kill
        if victim.isDead then
            print(attacker.name .. " killed " .. victim.name)
        end
    end
end

/* Respawn dead players */
function RespawnDeadPlayers()
    for i, player in ipairs(players) do
        if player.isDead then
            player:Respawn()
            print(player.name .. " respawned!")
        end
    end
end

// Cleanup invalid players
function CleanupPlayers()
    local validPlayers = {}

    for i, player in ipairs(players) do
        /* Keep only valid players */
        if player != nil && player.name != "" then
            table.insert(validPlayers, player)
        end
    end

    players = validPlayers
end

// Main execution
InitializePlayers()
SimulateCombat()
UpdatePlayers()
RespawnDeadPlayers()
CleanupPlayers()

/* Final statistics */
local aliveCount = 0
local deadCount = 0

for i, player in ipairs(players) do
    if player:IsAlive() then
        aliveCount = aliveCount + 1
    else
        deadCount = deadCount + 1
    end
end

print("Alive: " .. aliveCount .. ", Dead: " .. deadCount)

// End of simulation
