<script lang=ts>
    import {ChevronUp, ChevronDown} from "lucide-svelte"

    export let maxHeight : string;

    let clientHeight : number = 0;

    export let open = false;

    function ToggleExpand(){
        open = !open;
    }

</script>
<div class="wrapper {open? "open" : ""}" style="{open? "max-height: 100rem;" : "max-height :" + maxHeight}">
    <slot/>
    <div class="overlay">
        <button type="button" class="expandButton" on:click={ToggleExpand}>
            {#if open}
                <ChevronUp size={30}/>
            {:else}
                <ChevronDown size={30}/>
            {/if}
        
        </button>
    </div>
</div>


<style>
    .open{
        grid-template-rows: 1fr;
    }
    .wrapper{
        position:relative;
        display: grid;
        grid-template-rows: 0fr;
        transition: all 200ms ease;
        overflow: hidden;
    }
    .overlay{
        position:absolute;
        left:0;
        left:0;
        width:100%;
        height:100%;
        background: linear-gradient( rgba(28, 28, 28, 0), var(--color-soft-black));
        display:flex;
        flex-direction: column;
        justify-content: end;
        border-radius: .75rem;
        transition: all 200ms ease;
    }
    .wrapper.open .overlay{
        background: none;
    }
    .expandButton{
        background:none;
        border:none;
        outline:none;
        color:white;
    }
</style>

