<script lang=ts>
    import { onMount } from "svelte";
    import Expandable from "$lib/components/Expandable.svelte";
    import {Github, ExternalLink, Circle, ChevronsDown, Linkedin} from "lucide-svelte"
    import Starfield from "$lib/components/Three/Starfield.svelte";
    import ContactButton from "$lib/components/ContactButton.svelte";
    import { draw } from "svelte/transition";
    import { scrollPos } from "$lib/stores";

    let scrollPosition = 0;
    onMount(()=>{
        scrollPos.set(scrollPosition)
    })

    $:scrollPos.set(scrollPosition);
   
</script>

<svelte:window bind:scrollY={scrollPosition}/>

<div class="background">
    <Starfield/>
</div>

<main>
    <slot/>
</main>


<style>
    main{
        padding:.25rem;
    }
    .background{
        position: fixed;
        top:0;left:0;
        height: 100lvh;
        width: 100%;
        z-index: -1;
    }
</style>