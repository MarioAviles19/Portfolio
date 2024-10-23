<script lang=ts>
    import { Canvas } from "@threlte/core";
    import { interactivity } from "@threlte/extras";
    import Scene from "./Scene.svelte";

    let mouseX = 0;
    let mouseY = 0;

    let clientHeight = 0;
    let clientWidth = 0;

    function HandleMouseMove(e : any){
        mouseX = e.clientX;
        mouseY = e.clientY;
    }

</script>
<div bind:clientHeight bind:clientWidth aria-hidden="true" on:mousemove={HandleMouseMove}>
    <Canvas>
        <Scene  count={800} scale={5}/>
    </Canvas>
</div>

<style>
    div{
        width:100%;
        height:100%;
        animation: fadeIn 9000ms;
        
    }
</style>