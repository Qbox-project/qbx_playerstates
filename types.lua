------------
-- config --
------------

--- @class RangeData
--- @field min number
--- @field max number

--- @class NotificationStyle The style of a notification
--- @field backgroundColor string The background color of the notification
--- @field color string The color of the notification

--- @class NotificationData The data of a notification
--- @field id string The unique identifier of the notification (e.g. 'stress-up', 'stress-down', 'hunger-up', 'hunger-down', 'thirst-up', 'thirst-down', 'thc-up', 'thc-down', 'alcohol-up', 'alcohol-down')
--- @field value? number The value of the state change that trigger the notification
--- @field title string The title of the notification
--- @field description string The description of the notification
--- @field duration number The duration of the notification in milliseconds
--- @field icon string The icon of the notification
--- @field iconColor string The color of the icon
--- @field style NotificationStyle The style of the notification

--- @class PlayerStateFieldsConfig The fields configuration of a player state
--- @field statebag? string The statebag key of the state
--- @field metadata? string The metadata key of the state

--- @class PlayerStateValueConfig The value configuration of a player state
--- @field default number
--- @field range RangeData

--- @class NotificationConfig The configuration for a notification
--- @field up? NotificationData The data of the notification when the state increase
--- @field down? NotificationData The data of the notification when the state decrease

--- @class DisableConfig
--- @field range? RangeData
--- @field keys? number[]
--- @field inventory? boolean
--- @field radialMenu? boolean
--- @field targeting? boolean
--- @field emotes? boolean
--- @field radio? boolean
--- @field phone? boolean

--- @class DecayConfig The decay configuration of a player state
--- @field interval number The interval of the decay in milliseconds
--- @field value number The value of the decay

--- @class AnimationConfig
--- @field dict string
--- @field clip string
--- @field duration number
--- @field flag? number
--- @field range? RangeData
--- @field requiredStates? StateConfig[]
--- @field notAllowedStates? StateConfig[]

--- @class PropConfig
--- @field model string
--- @field pos vector3
--- @field rot vector3
--- @field range? RangeData

--- @class StateConfig
--- @field id string The unique identifier of the state (e.g. 'stress', 'hunger', 'thirst', 'thc', 'alcohol')
--- @field range? RangeData The range of the state if it has a value
--- @field errorMsg? string The error message to display
--- @field remove? boolean Whether it is required to remove the state or to add it, default is false

--- @class PlayerStateConfig The configuration for a player state
--- @field id string The unique identifier of the state (e.g. 'stress', 'hunger', 'thirst', 'thc', 'alcohol')
--- @field label string The label of the state (e.g. 'Stress', 'Hunger', 'Thirst', 'THC', 'Alcohol')
--- @field fields PlayerStateFieldsConfig The fields configuration of the state
--- @field permanent boolean Whether the state is permanent or not
--- @field value? PlayerStateValueConfig The value configuration of the state
--- @field notification? NotificationConfig The configuration for the notification
--- @field disable? DisableConfig The configuration to disable some actions
--- @field decay? DecayConfig The decay configuration of the state
--- @field animations? AnimationConfig[] The animation configuration of the state
--- @field props? PropConfig[] The prop configuration of the state
--- @field requiredStates? StateConfig[] The states that are required to enable this state
--- @field notAllowedStates? StateConfig[] The states that are not allowed to enable this state
