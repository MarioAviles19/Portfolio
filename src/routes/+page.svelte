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

<div class="banner">

    <h1 class="name">Mario Javier Aviles <span class="circle">&#9900;</span> Developer</h1>
    <p class="about">
        Hi! I'm Mario, a web developer based in Minneapolis, MN looking to make my way into the web development industry.
    </p>
    <div class="personalLinks">
        <a target="_blank" href="https://github.com/MarioAviles19" class="githubIcon">
            <Github size={35} color="rgb(163, 163, 163)" />
        </a>
        <a target="_blank" href="https://linkedin.com/in/mario-aviles-29441a281" class="linkedinIcon">
            <Linkedin size={35}  color="rgb(163, 163, 163)" />
        </a>

    </div>
  

 
</div>

<div class="contactInfo card">
    <h2>Contact</h2>
    <p>If you're looking to connect, feel free to reach out to me on LinkedIn or email me at
        <a href="mailto:contact@marioaviles.com">Contact@MarioAviles.com</a>
    </p>
</div>

<div class="projects">
    <h2>Projects</h2>
    <div class="projectCard">
        <div class="cardHead">
            <div class="sideBySide">
                <a href="https://pl-rhc-data.firebaseapp.com/">
                    <div class="imageContainer">
                        <img class="cardImage" src="preleaseLogo.png" alt="Thumbnail showing the PreLease Website">
                    </div>
                </a>
                <h3 class="title">Prelease</h3>
            </div>

            <div class="links">
                <a target="_blank" href="https://github.com/MarioAviles19/PreLease" class="githubIcon">
                    <Github color="rgb(163, 163, 163)" />
                </a>
                <a href="https://pl-rhc-data.firebaseapp.com" class="externIcon">
                    <ExternalLink />
                </a>
            </div>  
        </div>

        <div class="info">



                <p class="body">
                    This is a web application I made while interning at PreLease SBC, a start-up focused on connecting renters with resources which is now inactive. 
                    <br>
                    <br>
                    Although it is in an unfinished state, It represents several months of work designing and implementing
                    features per the requirements of PreLease's owners. It features two primary systems, the "Rental Health Check"
                    which is a survey that would calculate the "Rental Health" of the user based upon one of the owner's
                    expertise in the area.
                    <br>
                    <br>
                    It also included a "Rate My Landlord" function that would provide people with the ability to leave
                    reviews for landlords. Although it isn't very useful without standardizing and validating addresses which was planned,
                    but unfortunately never came to be.

                </p>

        </div>
    </div>

   
</div>




<style>
    h2{
        margin-top: 0;
    }

    .name{
        color:#00000000;
        background:linear-gradient(-45deg, rgb(206, 61, 255), orange);
        background-clip: text;
        text-align: center;
        margin: auto;
        width:fit-content;
        margin-top:2rem;
        font-size:2.5rem;

    }
    .about{

        color:white;
        background:linear-gradient(-45deg, rgb(206, 61, 255), orange);
        background-clip: text;
        text-align: center;
        font-size: 1.2rem;
        width: clamp(5rem, 100%, 30rem);
        margin:auto;
        margin-top:2rem;
    }
    .banner{
        min-height: 100svh;
        
    }
    .background{
        position: fixed;
        top:0;left:0;
        height: 100lvh;
        width: 100%;
        z-index: -1;
    }
    .imageContainer{
        position:relative;
        max-height: 100%;
        max-width: 6rem;
    }
    .cardImage{
        width: 100%;
        height: 100%;
        object-fit: contain;
        object-position: top;

        
    }
    .cardHead{
        display: flex;
        justify-content: space-between;
        align-items: center;
        gap:.5rem;
        margin-top: .5rem;
    }
    .sideBySide{
        display: flex;
        justify-content: left;
        align-items: center;
        gap:1rem;
    }
    .projects{
        width: clamp(10rem, 100%, 70rem);
        margin: auto;
        padding: .5rem;
        border-radius: .5rem;

    }
    .projectCard{
        
        padding: .25rem;

        border-radius: .5rem;
        border: rgb(163, 163, 163) 3px solid;
        background-color: rgba(255, 255, 255, 0.033);
        transition: all 250ms ease;
        margin: 1rem 0;
    }
    .projectCard:hover{
        box-shadow: 5px 5px 7px 7px rgb(17, 17, 17);
    }
    .card{
        
        padding: 1.25rem;

        border-radius: .5rem;
        border: rgb(163, 163, 163) 3px solid;
        background-color: rgba(255, 255, 255, 0.033);
        transition: all 250ms ease;
        margin: 1rem 0;
    }
    .card:hover{
        box-shadow: 5px 5px 7px 7px rgb(17, 17, 17);
    }
    .projectCard .title{
        margin:0;
        font-size: 1.5rem;
    }
    .projectCard .info{
        display: flex;
        gap: .5rem;
    }
    .projectCard .body{
        margin-top: 0;
        padding:1rem;
    }
    .projectCard .imageContainer{
        padding:1rem;
        width:100%;
        height:100%;
        display: flex;
        justify-content: center;
        align-items: start;
    }
    .personalLinks{
        display: flex;
        justify-content: center;
        align-items: center;
        gap:1rem;
        margin-top:1rem;

    }
    .linkedinIcon{
        padding:.2rem;
        border: rgb(163, 163, 163) solid 2px;
        border-radius: .25rem;
        display: flex;
        align-items: center;
        justify-content: center;
        width:fit-content;
    }
    .githubIcon{
        padding:.2rem;
        border: rgb(163, 163, 163) solid 2px;
        border-radius: 99rem;
        display: flex;
        align-items: center;
        justify-content: center;
        width:fit-content;
    }
    .personalLinks .githubIcon{
        border-width: 3px;
    }
    .personalLinks .linkedinIcon{
        border-width: 3px;

    }
    .cardHead .links{
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 1rem;
    }
    .externIcon{

        color: rgb(163, 163, 163);
        margin-right:1rem;

    }
    @keyframes welcome{
        from {opacity: 1;}
        to {opacity: 0;}
    }
    @media screen and (max-width: 480px){
        .projectCard .info{
            flex-direction: column;
        }
    }
</style>