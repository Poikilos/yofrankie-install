# yofrankie-install
Setup yofrankie (version that uses Blender Game Engine from Blender
2.49a) on modern computers that only have later versions of Blender (by
automatically getting a run-in-place copy of the correct version).

## Install
- In terminal, run:
  `git clone https://github.com/poikilos/yofrankie-install.git && cd yofrankie-install && chmod +x run.sh`

### Using the binary version
(yofrankie_1_1b_bge)

#### Get sound working

##### Fedora ~30
```bash
sudo modprobe snd-pcm-oss
if [ -e "/dev/dsp1" ]; then
    if [ ! -e "/dev/dsp" ]; then
        sudo ln -s /dev/dsp1 /dev/dsp
    else
        echo "You already have /dev/dsp"
    fi
else
    echo "You do not have a snd-pcm-oss device at /dev/dsp1."
fi
```

## Usage
- In terminal (in directory of game), run: `./run.sh` (the matching
YoFrankie version and Blender version will be downloaded the first time
you run)
