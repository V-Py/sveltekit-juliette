<script lang="ts">
    import Banner from "$lib/components/Banner.svelte";
	import {gsap} from 'gsap';
	import { ScrollTrigger } from "gsap/dist/ScrollTrigger";
    import { onMount } from "svelte";

	export let data;
	let url = data.url;
	let ids = ["image_test_1", "image_test_2", "image_test_3"];

	let images_scroll_infos = [{
		id: "ara_rouge",
		initial_x:-400,
		initial_y:0,
		x: 0,
		y: 0
	},
	{
		id: "ara_vert",
		initial_x:0,
		initial_y:400,
		x: 0,
		y: 0
	},
	{
		id: "motmot",
		initial_x:400,
		initial_y:0,
		x: 0,
		y: 0
	}]

	onMount(() => {
		gsap.registerPlugin(ScrollTrigger);
		for(const image_scroll_info of images_scroll_infos){
			gsap.set('#'+image_scroll_info.id, {x:image_scroll_info.initial_x, y:image_scroll_info.initial_y})
			gsap.to('#'+image_scroll_info.id, {
				scrollTrigger:"#second-section",
				x:image_scroll_info.x,
				y:image_scroll_info.y,
				duration:1
			})
		}


		let delSections = document.querySelectorAll(".delayed-section");

		delSections.forEach(section => {
			
			let imageAnim = gsap.to(section.querySelector("img"), {
				y: "-100vh",
				ease: "none",
				paused: true
			});
			
			let progressTo = gsap.quickTo(imageAnim, "progress", {ease: "power3", duration: parseFloat(section.dataset.scrub) || 0.1});
			
			gsap.to(section.querySelector(".innerContainer"), {
				y: "100vh",
				ease: "none",
				scrollTrigger: {
				scrub: true,
				trigger: section,
				start: "top bottom",
				end: "bottom top",
				onUpdate: self => progressTo(self.progress)
				}
			});

		});

	});

	function animateImages() {
		for(const id of ids ){
			gsap.to("#"+id,{x:0, y:0});
		}
	}

	function scrollSecondSection(){
		document.getElementById('second-section').scrollIntoView({behavior: "smooth"});
	}

	function scrollThirdSection(){
		document.getElementById('third-section').scrollIntoView({behavior: "smooth"});
	}

</script>

<svelte:head>
	<title>Juliette Villars</title>
	<meta name="description" content="Juliette Villars website" />
</svelte:head>

<main class="mb-40 overflow-hidden">
	<div class="w-full flex flex-col justify-center items-center relative">
	<div class="h-[90vh]  w-full flex flex-col items-center pt-20 text-putty-800 gap-10 bg-putty-50">
		<h1 class="text-[10em] flex gap-4 items-center"><span>Juliette</span> <span>Villars</span></h1>
		<h2 class="text-lg text-putty-700 max-w-sm">Je suis une illustratice et carnettiste habitant à <b>Valence</b> spécialisé dans les dessins d'animaux.</h2>
		
		<button on:click={scrollSecondSection} type="button" class="bg-putty-200 bounce hover:bg-putty-100 mt-auto mb-20 w-32 h-32 rounded-full border border-putty-800 flex justify-center items-center">
			<i class="fas fa-arrow-down fa-2x"></i>
		</button>
	</div>
	<div id="second-section" class="h-screen w-full bg-[url('/img/jungle.jpeg')] second-section overflow-hidden" >
		<div  class="grid grid-cols-3 gap-20 p-20 h-[1000px] w-full relative">
			<!-- <div class="overflow-hidden relative rounded-lg">
				<img id="image_test_1" src="/img/carnet/png/20240419112115 32-1.png" alt="Juliette Villars " class="rounded-lg absolute" loading="lazy"/>
			</div> -->
			<div id="ara_rouge" class="img-container overflow-hidden relative rounded-2xl shadow-[rgba(255,255,255,_0.4)_0px_0px_150px]">
				<img  src="/img/carnet/png/20240419112115 33-1.png" alt="Juliette Villars" class="" loading="lazy"/>
				<div>
					
				</div>
			</div>
			<div id="ara_vert" class="img-container overflow-hidden relative rounded-2xl shadow-[rgba(255,255,255,_0.4)_0px_0px_150px]">
				<img  src="/img/carnet/png/20240419112115 34-1.png" alt="Juliette Villars" class="" loading="lazy"/>
			</div>
			<div id="motmot" class="img-container overflow-hidden relative rounded-2xl shadow-[rgba(255,255,255,_0.4)_0px_0px_150px]">
				<img  src="/img/carnet/png/20240419112115 35-1.png" alt="Juliette Villars" class="" loading="lazy"/>
			</div>
		</div>
	</div>

	<div id="third-section" class="h-screen w-full bg-white second-section overflow-hidden" >
		<div  class="grid grid-cols-3 p-20 h-[900px] w-full relative">
			<div id="del1" class="delayed-section left-10" data-scrub="0.5">
				<div class="innerContainer">
				  <img src="/img/carnet/png/20240419112115 33-1.png" alt="">
				</div>
			  </div>
			  <div id="del2" class="delayed-section top-20" data-scrub="0.2">
				<div class="innerContainer ">
				  <img src="/img/carnet/png/20240419112115 34-1.png" alt="">
				</div>
			  </div>
			  <div id="del3" class="delayed-section top-10 right-10" data-scrub="1">
				<div class="innerContainer">
				  <img src="/img/carnet/png/20240419112115 35-1.png" alt="">
				</div>
			  </div>
			  
		</div>
	</div>




	


</main>
<style>
@keyframes float {
	0% {
		transform: translateY(0px);
	}
	50% {
		transform: translateY(-20px);
	}
	100% {
		transform: translateY(0px);
	}
}

.second-section .img-container {
	animation: float 6s ease-in-out infinite;
}

.second-section .img-container:nth-child(2) {
	animation-delay: 1s;
}

.second-section .img-container:nth-child(3) {
	animation-delay: 2s;
}

.delayed-section {
  position: relative;
}

/* .delayed-section .inner-container {
  will-change: transform;
}
.delayed-section img {
  max-width: 100%;
  will-change: transform;
} */

	.box {
		width: 100px;
		height: 100px;
		background-color: #333;
		margin: 10px;
	}
	.a {
		background-color: red;
	}
	.b {
		background-color: blue;
	}
	.c {
		background-color: green;
	}
/* 
	.gradient{
		background:linear-gradient(to bottom, rgba(0,0,0,0.5), rgba(0,0,0,0), rgba(0,0,0,0.5));
		z-index:10;
	} */

	.radial-dark{
		background: rgb(58,26,14);
background: radial-gradient(circle, rgba(58,26,14,1) 0%, rgba(124,64,36,1) 35%, rgba(205,139,51,1) 100%);
	}

	.linear-light{
		background: rgb(252,248,238);
		background: linear-gradient(90deg, rgba(252,248,238,1) 0%, rgba(222,188,107,1) 35%, rgba(205,139,51,1) 52%);
	}

	.bounce{
		animation: bounce 2s ease infinite;
	}

	@keyframes bounce {
		0%, 20%, 50%, 80%, 100% {transform: translateY(0);}
	40% {transform: translateY(-30px);}
	60% {transform: translateY(-15px);}
	}

	.image-blurred-edge {
		box-shadow: 0 0 8px 8px white inset;
	}
</style>
