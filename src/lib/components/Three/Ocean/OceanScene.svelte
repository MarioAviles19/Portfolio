<script lang=ts>
    import { Canvas, T } from "@threlte/core";
    import { interactivity, OrbitControls } from "@threlte/extras";
    import { SimplexNoise } from "three/examples/jsm/Addons.js"
    import { useTask } from "@threlte/core";
    import { PlaneGeometry } from "three";
    import fragmentShader from "$lib/components/Shaders/Ocean/fragment.glsl?raw"
    import vertexShader from "$lib/components/Shaders/Ocean/vertex.glsl?raw"
    import { DEG2RAD } from "three/src/math/MathUtils.js";

    const meshSize = 50
    const resolution = 300
    let time = 0;
    let timeScale = 1;
    let geometry = new PlaneGeometry(meshSize, meshSize, resolution, resolution)
    let size = 30;
    let mat : any;
    export let frequency : string = "20";

    let uniforms = { 
        uAmplitude: {value: 1 },  
        uFrequency: {value: 5.0 }, 
        uTime : { value: 1 }, 
        size: { value: meshSize } 
        }

    useTask((d)=>{
        time += d * timeScale;
        uniforms.uTime.value = time;
    })
        console.log(new SimplexNoise())

        
    $: uniforms.uFrequency.value = parseFloat(frequency || "30"); 
</script>
    
        <T.PerspectiveCamera 
        makeDefault
        position={[30,40,30]}
        on:create={({ ref })=>{ ref.lookAt(0,1,0)}}
            
        >
            <OrbitControls
                target.y={1.5}
                autoRotateSpeed={3}
            />
        </T.PerspectiveCamera>
        <T.Mesh  rotation.x={DEG2RAD * -90} {geometry}>
            <T.ShaderMaterial bind:ref={mat} {vertexShader} {fragmentShader} 
            {uniforms}
            />
            
        </T.Mesh>

