# game_state_manager.verse
# Phase 1 root coordinator (classic creative_device).
# Holds @editable device references bound by Tom in the UEFN Details panel.
# Other modules (event_bus, economy, build, waves, persistence) will be added
# in follow-up files. For now this file only verifies wiring: it logs OnBegin,
# hides the wall prop, and logs button presses so we can see the device
# bindings work end-to-end.

using { /Fortnite.com/Devices }
using { /Fortnite.com/Characters }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

game_state_manager := class(creative_device):

    @editable
    PlayerSpawner : player_spawner_device = player_spawner_device{}

    @editable
    StarterItemGranter : item_granter_device = item_granter_device{}

    @editable
    BuyWallButton : button_device = button_device{}

    @editable
    ZombieSpawner : npc_spawner_device = npc_spawner_device{}

    @editable
    WallProp : creative_prop = creative_prop{}

    OnBegin<override>()<suspends>:void=
        Print("game_state_manager: OnBegin (Phase 1 stub)")
        WallProp.Hide()
        BuyWallButton.InteractedWithEvent.Subscribe(OnBuyWallPressed)

    OnBuyWallPressed(Agent : agent) : void =
        Print("game_state_manager: BuyWall pressed (stub)")
