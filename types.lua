------------
-- config --
------------

--- @class NotificationStyle The style of a notification
--- @field backgroundColor string The background color of the notification
--- @field color string The color of the notification

--- @class NotificationData The data of a notification
--- @field id string The unique identifier of the notification (e.g. 'stress-up', 'stress-down', 'hunger-up', 'hunger-down', 'thirst-up', 'thirst-down', 'thc-up', 'thc-down', 'alcohol-up', 'alcohol-down')
--- @field title string The title of the notification
--- @field description string The description of the notification
--- @field duration number The duration of the notification in milliseconds
--- @field value number The value of the state change that trigger the notification
--- @field icon string The icon of the notification
--- @field iconColor string The color of the icon
--- @field style NotificationStyle The style of the notification

--- @class NotificationConfig The configuration for a notification
--- @field up NotificationData The data of the notification when the state increase
--- @field down NotificationData The data of the notification when the state decrease

--- @class PlayerStateValueConfig The value configuration of a player state
--- @field min number The minimum value of the state
--- @field max number The maximum value of the state
--- @field default number The default value of the state

--- @class PlayerStateDecayConfig The decay configuration of a player state
--- @field interval number The interval of the decay in milliseconds
--- @field value number The value of the decay

--- @class PlayerStateConfig The configuration for a player state
--- @field id string The unique identifier of the state (e.g. 'stress', 'hunger', 'thirst', 'thc', 'alcohol')
--- @field fields {statebag: string, metadata: string}? The fields to store in the statebag and metadata
--- @field label string The label of the state (e.g. 'Stress', 'Hunger', 'Thirst', 'THC', 'Alcohol')
--- @field permanent boolean Whether the state is permanent or not
--- @field value PlayerStateValueConfig The value configuration of the state
--- @field decay PlayerStateDecayConfig? The decay configuration of the state
--- @field notification NotificationConfig? The configuration for the notification
--- @field effectData table? The custom effect data of the state

-------------
-- modules --
-------------

--- @class CLPlayerState
--- @field id string to identify the state
--- @field label string to display as state name
--- @field value number? the current value of the state
--- @field valueConfig PlayerStateValueConfig
--- @field notificationConfig NotificationConfig?

--- @class CLStateManager
--- @field states table<string, CLPlayerState>

--- @class SVPlayerState
--- @field id string
--- @field label string
--- @field permanent boolean
--- @field values table<number, number>
--- @field valueConfig PlayerStateValueConfig
--- @field decayConfig PlayerStateDecayConfig?

--- @class SVStateManager
--- @field states table<string, SVPlayerState>



-----------------------------
-- InteractionState config --
-----------------------------

--- @alias stateId string
--- @alias statebagKey string
--- @alias metadataKey string
--- @alias errorMessage string
--- @alias percentage number

--- @class AnimationConfig
--- @field dict string
--- @field clip string
--- @field duration? number
--- @field flag? number

--- @class StateFieldsConfig
--- @field playerState? statebagKey
--- @field playerMetadata? metadataKey
--- @field victimState? statebagKey
--- @field victimMetadata? metadataKey

--- @class StateAnimationConfig
--- @field playerIn AnimationConfig
--- @field victimIn AnimationConfig
--- @field playerIdle AnimationConfig
--- @field victimIdle AnimationConfig
--- @field playerOut AnimationConfig
--- @field victimOut AnimationConfig

--- @class PropConfig
--- @field model string
--- @field pos vector3
--- @field rot vector3

--- @class StatePropsConfig
--- @field playerIn PropConfig
--- @field victimIn PropConfig
--- @field playerIdle PropConfig
--- @field victimIdle PropConfig
--- @field playerOut PropConfig
--- @field victimOut PropConfig

--- @class StateDependencyConfig
--- @field requiredPlayerState? table<stateId, errorMessage>
--- @field requiredVictimState? table<stateId, errorMessage>
--- @field forbiddenPlayerState? table<stateId, errorMessage>
--- @field forbiddenVictimState? table<stateId, errorMessage>
--- @field rewardPlayerState? table<stateId, number>
--- @field rewardVictimState? table<stateId, number>
--- @field removePlayerState? table<stateId, number>
--- @field removeVictimState? table<stateId, number>

--- @class RequiredItemConfig
--- @field name string
--- @field amount number|{min: number, max: number}
--- @field persist percentage
--- @field errorMessage errorMessage

--- @class DisableConfig
--- @field keys? number[]
--- @field inventory? boolean
--- @field radialMenu? boolean
--- @field targeting? boolean
--- @field emotes? boolean
--- @field radio? boolean
--- @field phone? boolean

--- @class StateItemsConfig
--- @field playerIn? string
--- @field victimIn? string
--- @field playerOut? string
--- @field victimOut? string

--- @class InteractionStateConfig
--- @field id string
--- @field distance number
--- @field fields StateFieldsConfig
--- @field items? StateItemsConfig
--- @field props StatePropsConfig
--- @field animations StateAnimationConfig
--- @field dependencies StateDependencyConfig
--- @field disable DisableConfig
