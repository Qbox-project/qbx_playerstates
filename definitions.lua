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
--- @field min? number The minimum value of the state
--- @field max? number The maximum value of the state
--- @field default any The default value of the state

--- @class PlayerStateDecayConfig The decay configuration of a player state
--- @field interval number The interval of the decay in milliseconds
--- @field value number The value of the decay

--- @class PlayerStateClearConfig The clear configuration of a player state
--- @field swimming boolean Whether the state is cleared when the player is swimming or not

--- @class PlayerStateActionConfig The action configuration of a player state
--- @field chance number The chance of the action
--- @field threshold number The threshold of the action

--- @class AnimationConfig
--- @field condition fun(value: any): boolean
--- @field dict string
--- @field name string
--- @field flag number
--- @field prop? PropConfig[]

--- @class PropConfig
--- @field bone number
--- @field model string
--- @field pos vector3
--- @field rot vector3

--- @class FieldsConfig
--- @field stateBag string
--- @field metadata? string

--- @class DisableConfig
--- @field condition fun(value: any): boolean
--- @field keys? number[]
--- @field inventory? boolean
--- @field radialMenu? boolean
--- @field target? boolean
--- @field emotes? boolean
--- @field radio? boolean
--- @field phone? boolean

--- @class PlayerStateConfig The configuration for a player state
--- @field id string The unique identifier of the state (e.g. 'stress', 'hunger', 'thirst', 'thc', 'alcohol')
--- @field label string The label of the state (e.g. 'Stress', 'Hunger', 'Thirst', 'THC', 'Alcohol')
--- @field fields FieldsConfig The fields to use for the state
--- @field permanent boolean Whether the state is permanent or not
--- @field value? PlayerStateValueConfig The value configuration of the state
--- @field decay? PlayerStateDecayConfig The decay configuration of the state
--- @field clear? PlayerStateClearConfig The clear configuration of the state
--- @field puke? PlayerStateActionConfig The puke configuration of the state
--- @field overdose? PlayerStateActionConfig The overdose configuration of the state
--- @field notification? NotificationConfig The configuration for the notification
--- @field disable? DisableConfig The configuration for the disable
--- @field forcedAnimations? AnimationConfig[] The animations of the state
--- @field effectData? any The custom effect data of the state

-------------
-- modules --
-------------

--- @class AnimationState
--- @field animation AnimationConfig The current animation
--- @field props number[] Current prop handles

--- @class CLAnimationManager
--- @field states table<string, { animations: AnimationConfig[], value: any }> The states with their animations
--- @field currentAnimation AnimationState|nil The current animation state
--- @field props number[] The current prop handles
--- @field isLoopRunning boolean Whether the animation loop is running

--- @class CLDisableManager
--- @field stateDisables table<string, table>
--- @field loopRunning boolean
--- @field activeDisabledKeys table<number, number> -- key -> count of states disabling it
--- @field totalDisabledKeys number

--- @class CLPlayerState
--- @field id string
--- @field label string
--- @field value any
--- @field fields FieldsConfig
--- @field valueConfig PlayerStateValueConfig
--- @field isNumeric boolean
--- @field clearConfig? PlayerStateClearConfig
--- @field pukeConfig? PlayerStateActionConfig
--- @field overdoseConfig? PlayerStateActionConfig
--- @field notificationConfig? NotificationConfig
--- @field disableConfig? DisableConfig
--- @field animations? AnimationConfig[]
--- @field disableManager CLDisableManager
--- @field animationManager CLAnimationManager

--- @class CLStateManager
--- @field disableManager CLDisableManager
--- @field animationManager CLAnimationManager
--- @field states table<string, CLPlayerState>

--- @class SVPlayerState
--- @field id string
--- @field label string
--- @field fields FieldsConfig
--- @field permanent boolean
--- @field valueConfig PlayerStateValueConfig
--- @field values table<number, any>
--- @field isNumeric boolean
--- @field decayConfig? PlayerStateDecayConfig

--- @class SVStateManager
--- @field states table<string, SVPlayerState>
