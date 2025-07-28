<script lang=ts>
    import { Canvas, T } from "@threlte/core";
    import OceanScene from "./OceanScene.svelte";

    let size;
    let frequency = "50";
</script>



    <div class="full">
        <Canvas>
            <OceanScene bind:frequency/>
        </Canvas>
    </div>
<div class="panel">
    <h1>controls</h1>
    {size}
    <input type="number" bind:value={frequency}>
</div>

<style>
    .panel{
        background-color: rgb(62, 60, 60);
        color:white;
        position: fixed;
        top: .5rem;
        right: .5rem;
    }
    .full{
        width: 100%;
        height:100%;
        min-height: 100svh;

        background-color: rgb(35, 35, 35);
    }

</style>