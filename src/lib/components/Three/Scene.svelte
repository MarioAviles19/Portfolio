<script lang=ts>
    import { quadIn } from "svelte/easing";
    import { scrollPos } from "$lib/stores";
    import { Vector3 } from "three/src/math/Vector3.js";
    import { T, useTask} from "@threlte/core";
    import { interactivity, InstancedMesh, Instance} from "@threlte/extras";
    import fragmentShader from "$lib/components/Shaders/Stars/fragment.glsl?raw"
    import vertexShader from "$lib/components/Shaders/Stars/vertex.glsl?raw"
    import { lerp } from "three/src/math/MathUtils.js";
    


    export let count : number;
    export let scale : number;
    const randomGaussian = (): number => {
        // Using Box-Muller transform to generate a Gaussian-distributed number
        const u1 = Math.random();
        const u2 = Math.random();
        const z0 = Math.sqrt(-2.0 * Math.log(u1)) * Math.cos(2.0 * Math.PI * u2);
        return z0; // Return a number from a standard normal distribution
    };


    function GeneratePoints(count : number, scale : number, density : number){
        let points : Array<{position : Array<number>, velocity : Array<number>, scale : number}> = []

        let position = []
        let velocity = [];


        for(let i = 0; i < count; i++){
          

            let x = randomGaussian() * scale
            let y = randomGaussian() * scale
            let z = randomGaussian() * scale

            let vx = randomGaussian() * .005
            let vy = randomGaussian() * .005
            let vz = randomGaussian() * .005

            let objScale = Math.abs(randomGaussian() + 1)

            points.push({position: [x,y,z], 
              velocity : [vx,vy,vz],
              scale : objScale
            })
        }
        return points;
    }
    let rotationy = 0;
    let speed = .01;
    let maxDistance = 25;

    let directionVec = new Vector3()
    useTask((del)=>{
      rotationy += del * speed;
      
      for (let i = 0; i < points.length; i++) {
        if(Math.abs(points[i].position[0]) + Math.abs(points[i].position[1]) + Math.abs(points[i].position[2]) > 20){
          
          directionVec.subVectors({x: 0, y: 0, z: 0}, {x: points[i].position[0], y: points[i].position[1], z: points[i].position[2]}).normalize();

          points[i].velocity = [directionVec.x * points[i].velocity[0], directionVec.y * points[i].velocity[1], directionVec.z  * points[i].velocity[2]]
        }
        points[i].position = [points[i].position[0] + points[i].velocity[0], points[i].position[1] + points[i].velocity[1], points[i].position[2] + points[i].velocity[2]]
        
      }
      points = points;
    })

    interactivity({
      filter: (hits, state) => {
      // Only return the first hit
      return hits.slice(0, 1)
    }
    })

    let maxHeight = window.innerHeight;
    let points = GeneratePoints(count, scale, 2)
  
    let cameraLerp = 10;

    function clamp(value : number) {
    return Math.max(0, Math.min(1, value));
}

    scrollPos.subscribe((e)=>{
      cameraLerp = lerp(10, 0,  clamp(quadIn($scrollPos/maxHeight)));

      console.log({cameraLerp, ease: quadIn($scrollPos/maxHeight)})
    })
    


  
    //Might come back to this at some point
    // function MouseOver(point : Vector3, index : number){
      


    //   let newVel = [point.x - points[index].position[0], point.y - points[index].position[1], point.z - points[index].position[2]];
    //   let spd = .1;
    //   points[index].velocity = [newVel[0] * spd, newVel[1] * spd, newVel[2] * spd]

    // }

  console.log(cameraLerp)
    
  

</script>
<T.Group position={[0,0,0]}  rotation.y={rotationy}>
  <T.PerspectiveCamera
    makeDefault
    position={[cameraLerp, cameraLerp, cameraLerp]}
    
    
    on:create={({ ref }) => {
      ref.lookAt(0, 1, 0)
    }}
  >



</T.PerspectiveCamera>

</T.Group>

<T.AmbientLight/>


 
 
    <InstancedMesh>

      
      <T.ShaderMaterial {vertexShader} {fragmentShader} />
      <T.BoxGeometry args={[.02, .02, .02]} />

      {#each points as point, i}
      <Instance position={point.position}  scale={points[i].scale}/>
      {/each}

    </InstancedMesh>

