# Real-time Object Detection with Phoenix and Python

In this repository you find the code described in the [Real-time Object Detection with Phoenix and Python](https://www.poeticoding.com/real-time-object-detection-with-phoenix-and-python/) article by Alvise Susmel.

I slightly adapted some parts:

  * updated to Phoenix 1.5
  * added LiveView
  * added Live Dashboard

## Configuration
Configure the `Yolo.Worker` in [`config/dev.exs`](config/dev.exs)

```elixir
config :yolo, Yolo.Worker,
  python: "python", # with Anaconda3 and yolo env is "/opt/anaconda3/envs/yolo/bin/python"
  detect_script: "python_scripts/detect.py",
  model: {:system, "YOLO_MODEL"}
```

* `:python` is the path of your python3.6 executable
* `:detect_script` is the path of the [`detect.py`](python_scripts/detect.py) script.
* just leave `:model` set to `{:system, "YOLO_MODEL"}` - it will load the model name from the `YOLO_MODEL` environment variable.
