@deriving({jsConverter: newType})
type direction =
  | @as(1) DIRECTION_NONE
  | @as(2) DIRECTION_LEFT
  | @as(4) DIRECTION_RIGHT
  | @as(8) DIRECTION_UP
  | @as(16) DIRECTION_DOWN
  | @as(6) DIRECTION_HORIZONTAL
  | @as(24) DIRECTION_VERTICAL
  | @as(30) DIRECTION_ALL

type events = [
  | #pan
  | #panstart
  | #panmove
  | #panend
  | #pancancel
  | #panleft
  | #panright
  | #panup
  | #pandown
  | #pinch
  | #pinchstart
  | #pinchmove
  | #pinchend
  | #pinchcancel
  | #pinchin
  | #pinchout
  | #press
  | #pressup
  | #rotate
  | #rotatestart
  | #rotatemove
  | #rotateend
  | #rotatecancel
  | #swipe
  | #swipeleft
  | #swiperight
  | #swipeup
  | #swipedown
  | #tap
]

@deriving({jsConverter: newType})
type inputEvents =
  | @as(1) INPUT_START
  | @as(2) INPUT_MOVE
  | @as(4) INPUT_END
  | @as(8) INPUT_CANCEL

type position = {
  x: int,
  y: int,
}

type pointer = [#touch | #mouse | #pen | #kinect]

module Instance = {
  type t

  type event = {
    @as("type") type_: events,
    deltaX: int,
    deltaY: int,
    deltaTime: int,
    distance: float,
    angle: float,
    velocityX: float,
    velocityY: float,
    velocity: float,
    direction: abs_direction,
    offsetDirection: abs_direction,
    scale: float,
    rotation: float,
    center: position,
    srcEvent: Dom.event,
    target: Dom.element,
    pointerType: pointer,
    eventType: abs_inputEvents,
    isFirst: bool,
    isFinal: bool,
    pointers: array<pointer>,
    changedPointers: array<pointer>,
    preventDefault: unit => unit,
  }
}

@module("@egjs/hammerjs") @new
external makeWithElement: Dom.element => Instance.t = "default"

@send external on: (Instance.t, events, Instance.event => unit) => unit = "on"
@send external off: (Instance.t, events, Instance.event => unit) => unit = "off"
@send external destroy: Instance.t => unit = "destroy"
