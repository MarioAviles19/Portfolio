<script lang=ts>
    import {Github, ExternalLink, Circle, ChevronsDown, Linkedin} from "lucide-svelte"
</script>


<div class="banner">

    <h1 class="name">Mario Javier Aviles <span class="circle">&#9900;</span> Developer</h1>
    <p class="about">
        Hi! I'm Mario, a web developer based in Minneapolis, MN with a passion for learning and taking on new challenges.
    </p>
    <div class="personalLinks">
        <a target="_blank" href="https://github.com/MarioAviles19" class="githubIcon">
            <Github size={35} color="white" />
        </a>
        <a target="_blank" href="https://linkedin.com/in/mario-aviles-29441a281" class="linkedinIcon">
            <Linkedin size={35}  color="white" />
        </a>
    </div>
  

 
</div>

<div class="contactInfo card">
    <h2>Contact</h2>
    <div class="">
        <span class="smallHeading">Email</span>
        <div class="contactLink"><a target="_blank" href="mailto:contact@marioaviles.com">Contact@MarioAviles.com</a></div>
        <span class="smallHeading">LinkedIn</span>
        <div class="contactLink"><a target="_blank" href="https://www.linkedin.com/in/mario-aviles-29441a281/">https://www.linkedin.com/in/mario-aviles-29441a281/</a></div>
        <span class="smallHeading">Github</span>
        <div class="contactLink">
            <a target="_blank" href="https://github.com/MarioAviles19">https://github.com/MarioAviles19</a>
        </div>
    </div>
</div>

<div class="projects">
    <h2>Projects</h2>
    <div class="projectCard">
        <div class="cardHead">
            <div class="sideBySide">
                <a target="_blank" href="https://pl-rhc-data.firebaseapp.com/">
                    <div class="imageContainer">
                        <img class="cardImage" src="ConwayLogo.svg" alt="Thumbnail showing the Conway Beats Website">
                    </div>
                </a>
                <h3 class="title">Conway's Beats</h3>
            </div>

            <div class="links">
                <a target="_blank" href="hhttps://github.com/MarioAviles19/Conways-Beats" class="githubIcon">
                    <Github size={30} />
                </a>
                <a target="_blank" href="https://conways-beats.pages.dev/" class="externIcon">
                    <ExternalLink size={35}/>
                </a>
            </div>  
        </div>

        <div class="info">
            <p class="body">
                Built after attending a jazz jam session with a friend, 
                this is a little project that was a fun introduction to ToneJs, which I plan to explore more in future projects.
            </p>
        </div>
    </div>
    <div class="projectCard hidden">
        <div class="cardHead">
            <div class="sideBySide">
                <a target="_blank" href="https://pl-rhc-data.firebaseapp.com/">
                    <div class="imageContainer ">
                        <img class="cardImage" src="preleaseLogo.png" alt="Thumbnail showing the PreLease Website">
                    </div>
                </a>
                <h3 class="title">Prelease</h3>
            </div>

            <div class="links">
                <a target="_blank" href="https://github.com/MarioAviles19/PreLease" class="githubIcon">
                    <Github size={30} />
                </a>
                <a href="https://pl-rhc-data.firebaseapp.com" target="_blank" aria-hidden="true" class="externIcon hidden">
                    <ExternalLink size={35}/>
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
    .smallHeading{
        font-size: medium;
        margin-bottom: 0;
        display: block;
    }
    .contactLink{
        margin-bottom: 1rem;
        display: block;
    }
    .hidden{
        opacity: 0;
        pointer-events: none;
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
    .hidden{
        display:none;
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
        background: linear-gradient(45deg, rgb(36, 36, 36) 0%, rgb(31, 31, 31) 85%, rgba(71,9,121,1) 100%, rgba(255,94,0,1) 100%);
        background-position: left top;
        transition: all 250ms ease;
        box-shadow: 2px 2px 7px 7px rgba(17, 17, 17, 0.639);

        margin: 1rem 0;
    }
    
    .projectCard:hover{
        box-shadow: 5px 5px 7px 7px rgb(17, 17, 17);
        background-position: 20% 20%;
        transform: translate(0, -3px);
    }
    .card{
        
        padding: 1.25rem;

        border-radius: .5rem;
        background-color: rgb(36, 36, 36);
        transition: all 250ms ease;
        box-shadow: 2px 2px 7px 7px rgba(17, 17, 17, 0.639);

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
        font-size: medium;
        font-weight: 300;
    }
    .projectCard .imageContainer{
        padding:1rem;
        width:100%;
        height:100%;
        min-width: 5rem;
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
        border: white solid 2px;
        border-radius: .25rem;
        display: flex;
        align-items: center;
        justify-content: center;
        width:fit-content;
    }
    .githubIcon{
        padding:.35rem;
        border: white solid 3px;
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

        color: white;
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