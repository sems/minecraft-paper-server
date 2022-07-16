# Paper server preset

# Setup and running the server

The startup for the first time is some what diffrent compared to every next startup. So hereby a small guide how to, and what to do. Most of these steps are also listed in the console itself;
- Set the correct amount of RAM you want to allocate for the server in the `start.sh` file. 
  - The `Xmx18G`-argument correlates to the maximum amount of memory the minecraft-server may use, and `Xms8G` to the minimum. 
  - Change the `18G` and `8G` to the amount you want to allocate, `G` stands to Gibibytes in this case. 
- Run `./start.sh`. If you get a message that `tmux` is not recognized, run `sudo apt-get install tmux` first;
- You will see a message which states that you need to accept the EULA, which is located in `eula.txt`;
  - In this file set `eula=false` to `eula=true`, hereby you accept all terms and conditions listed in the link given;
- Run `./start.sh` again; 
- Attach to the background-session with: `tmux attach -t minecraft-server`;

# Additional setup

## Dynmap

> There are already some changes made to this template, including the dynmap configuration. Below you will find a small but comprehensive guide about, some basic changes, where some are already done. You may want to use these instructions in some other way.

Most of us server-administrator knowns that process optimisation is one of the lead tasks. Dynmap is maybe one of the hardest plugins to optimise. One of the biggest reasons is physical data-size. 

> 💡 A fully rendered Dynmap with a radius of 15.000 blocks can take up to 100GB in size (With the default config).

There are three default views per world. Note: the 3D-views are in high-resolution:

- Standard top-down view.
- 3D-view on a 30-degree angle faced from the south-east.
- 3D-view of caves (underground).

## Preparation

We are assuming that all of these commands are performed in-game by a player with the right privileges. These commands can be ran in the console. When you are doing this, you need to remove the `/` before each command.

Before you start editing the Dynmap configuration, you'll need to stop the Dynmap engine. Otherwise the plugin doesn't allow you to edit the config.

```jsx
// First of all stop the dynmap engine
/dynmap pause all
```

## Disabling/enabling default worlds

Dynmap sees every dimension as a separate world. This is why we need to disable the nether and the end separately. 

```jsx
// Disable specific worlds
// Don't use quotes for worlds without a space in their name(s)
// If you want to do an opposite operation, like enabling a certain world. Change false to true.
/dmap worldset world_the_end enabled:false
/dmap worldset world_nether enabled:false

// Use quotes for worlds with a space in the name
/dmap worldset "Biome Bundle_nether" enabled:false
/dmap worldset "Biome Bundle_the_end" enabled:false
```

## Disabling default views

We want to disable the views that are default per world that aren't disabled before this step. Since we already disabled all worlds expect the *New_World* and *Biome Bundle* those are the only ones left. Note: this step will delete all the remaining default views. If you wish to keep one you can!

```jsx
// Use quotes for worlds with a space in the name
/dmap mapdelete "Biome Bundle":surface
/dmap mapdelete "Biome Bundle":flat
/dmap mapdelete "Biome Bundle":cave

// Don't use quotes for worlds without a space
/dmap mapdelete world:surface
/dmap mapdelete world:flat
/dmap mapdelete world:cave
```

## Creating new views

Now that all the default views of the remaining worlds are deleted we want to create some new views. These views are 3D and have the same view-angle as the default, but in a lower resolution, which of-course takes less hard-disk-space.

A list of predefined perspectives can be found here: [https://github.com/webbukkit/dynmap/wiki/Full-list-of-predefined-perspectives](https://github.com/webbukkit/dynmap/wiki/Full-list-of-predefined-perspectives)

```jsx
// The confention for adding a new world is as followed
/dmap mapadd [WorldName]:[WorldViewName] title:[visible name] perspective:[perspective] lighting:[lighting-mode] shader:stdtexture icon:[icon-location]

// Adding a new views to the worlds
/dmap mapadd New_World:South_East title:"South East" perspective:iso_SE_30_medres lighting:shadows shader:stdtexture icon:images/block_surface.png
/dmap mapadd "Biome Bundle":South_East title:"South East" perspective:iso_SE_30_lowres lighting:shadows shader:stdtexture icon:images/block_surface.png

/dmap mapadd world:South_East title:"South East" perspective:iso_SE_30_lowres lighting:shadows shader:stdtexture icon:images/block_world_surface.png
/dmap mapadd world:North_West title:"North West" perspective:iso_NW_30_lowres lighting:shadows shader:stdtexture icon:images/block_world_surface.png
```

Now re-enable the dynmap service with:

```jsx
/dynmap pause none
```
