<script>
    import {Mail} from "lucide-svelte"
</script>

<button><span class="icon"><Mail/></span> Contact</button>


<style>
    button{
        font-size: 1rem;
        font-weight: 600;
        vertical-align: middle;

        border-radius: .5rem;
        background-color: rgb(206, 61, 255);
        color:white;

        outline: none;
        border:none;

        padding:.5rem .75rem;
        
    }
    .icon{
        vertical-align: middle;
    }
</style>