<script lang="ts">
    import Banner from "$lib/components/Banner.svelte";
	import {gsap} from 'gsap';
	import { ScrollTrigger } from "gsap/dist/ScrollTrigger";
    import { onMount } from "svelte";

	export let data;
	let ids = ["image_test_1", "image_test_2", "image_test_3"];
    // import ColorThief from 'colorthief';
    // let colorThief:ColorThief;

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

	let roundedImagesInfos = [
		{
			src: "/img/carnet/png/20240419112115 33-1.png",
			alt: "Juliette Villars",
			top: 50,
			left: 50,
			scale: 2,
			topOffset: 90,
			leftOffset: -50,
		},
		{
			src: "/img/carnet/png/20240419112115 34-1.png",
			alt: "Juliette Villars",
			top: 500,
			left: 500,
			scale: 2,
			topOffset: 100,
			leftOffset: 70,
		},
		{
			src: "/img/carnet/png/20240419112115 35-1.png",
			alt: "Juliette Villars",
			top: 400,
			left: 1200,
			scale: 3,
			topOffset: -40,
			leftOffset: 0,
		},
		{
			src: "/img/carnet/png/20240419112115 36-1.png",
			alt: "Juliette Villars",
			top: 20,
			left: 1600,
			scale: 3,
			topOffset: 180,
			leftOffset: 30,
		},
		{
			src: "/img/carnet/png/20240419112115 38-1.png",
			alt: "Juliette Villars",
			top: -20,
			left: 800,
			scale: 2,
			topOffset: -65,
			leftOffset: -70,
		},
		{
			src: "/img/carnet/png/20240419112115 7-1.png",
			alt: "Juliette Villars",
			top: 600,
			left: 1600,
			scale: 3,
			topOffset: 30,
			leftOffset: 30,
		},
		{
			src: "/img/carnet/png/20240419112115 9-1.png",
			alt: "Juliette Villars",
			top: 400,
			left: 50, 
			scale: 3,
			topOffset: 110,
			leftOffset: -100,
		},
	]
</script>

<svelte:head>
	<title>Juliette Villars</title>
	<meta name="description" content="Juliette Villars website" />
</svelte:head>

<div class="py-32 z-10 overflow-hidden">
	<div class="w-full flex flex-col justify-center items-center relative">
		<!-- <div class="h-[90vh]  w-full flex flex-col items-center pt-20 text-putty-800 gap-10 bg-putty-50"> -->
		<div class="h-[90vh]  w-full flex flex-col items-center pt-20 text-putty-800 gap-10 bg-transparent relative">
			<h1 class="text-[12em] flex gap-4 items-center z-1 mt-10"><span>Juliette</span> <span>Villars</span></h1>
			<!-- <h2 class="text-lg text-putty-700 max-w-sm">Je suis une illustratice et carnettiste habitant à <b>Valence</b> spécialisée dans les dessins d'animaux.</h2> -->
			
			<button on:click={scrollSecondSection} type="button" class="bg-putty-100 opacity-70 hover:opacity-90 mt-auto mb-20 w-24 h-24 rounded-full border border-putty-800 flex justify-center items-center">
				<i class="fas fa-arrow-down fa-2x"></i>
			</button>

			{#each roundedImagesInfos as info, index}
				{@const floatingClass = `floating${Math.ceil(Math.random() * 3)}`}
				<div style:animation-delay="{500 * index}ms" style:top="{info.top}px" style:left="{info.left}px" class="overflow-hidden w-[150px] h-[150px] absolute rounded-full {floatingClass} z-0">
					<img  style:top="{info.topOffset}px" style:left="{info.leftOffset}px" src="{info.src}" alt="Juliette Villars" class="absolute object-cover z-0 scale-[{info.scale}]" loading="lazy"/>
				</div>
			{/each}
		</div>
		<!-- <div id="second-section" class="h-screen w-full bg-[url('/img/jungle.jpeg')] second-section overflow-hidden" >
			<div  class="grid grid-cols-3 gap-20 p-20 h-[1000px] w-full relative">
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
		</div> -->

		<!-- <div id="second-section" class="h-screen w-full bg-[url('/img/jungle.jpeg')] second-section overflow-hidden" > -->
		<!-- <div id="second-section" class="h-screen w-full bg-transparent second-section overflow-hidden" >
			<div  class="grid grid-cols-3 px-20 h-[900px] w-full relative">
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
		</div> -->

		<div id="carnet-section" class="mt-40 px-20 w-full bg-transparent overflow-hidden">
			<h2 class="text-putty-800 text-8xl text-center">Les beaux oiseaux</h2>
			<div class="grid grid-cols-3 grid-rows-1 justify-center gap-20 h-full w-full relative">
				<div class="relative col-span-1">
					<!-- <div id="circle-1" class="rounded-full w-[500px] h-[500px] bg-gradient-to-r from-[#E74414] to-[#fcfae7]"></div> -->
					<!-- <div id="circle-1" class="rounded-full w-[500px] h-[500px] red-gradient"></div> -->
					<div class="overflow-hidden w-[400px] h-[400px] absolute top-[50px] left-[50px] rounded-full">
						<img src="/img/carnet/italie/image3.png" alt="Juliette Villars" class="absolute object-cover scale-[3] top-40 right-[330px]" loading="lazy"/>
					</div>
				</div>
				<div class="relative col-span-1">
					<div id="circle-2" class="rounded-full w-[500px] h-[500px] bg-gradient-to-l bg-transparent"></div>
					<div class="overflow-hidden w-[400px] h-[400px] absolute top-[50px] left-[50px] rounded-full">
						<img src="/img/carnet/png/20240419112115 33-1.png" alt="Juliette Villars" class="absolute object-cover scale-[2] top-60 right-32" loading="lazy"/>
					</div>
				</div>
				<div class="relative col-span-1">
					<!-- <div id="circle-3" class="rounded-full w-[500px] h-[500px] bg-gradient-to-r from-[#4a8783] to-[#fcfae7]"></div> -->
					<div class="overflow-hidden w-[400px] h-[400px] absolute top-[50px] left-[50px] rounded-full">
						<img src="/img/carnet/png/20240419112115 35-1.png" alt="Juliette Villars" class="absolute object-cover scale-[3] -bottom-20 left-4" loading="lazy"/>
					</div>
				</div>
			</div>
		</div>

		<div id="grid-section" class="mt-40 px-20 w-full bg-transparent overflow-hidden">
			<div class="grid grid-cols-3 grid-rows-1 justify-center gap-20 h-full w-full relative">
				<div class="relative col-span-1">
					<!-- <div id="circle-1" class="rounded-full w-[500px] h-[500px] bg-gradient-to-r from-[#E74414] to-[#fcfae7]"></div> -->
					<!-- <div id="circle-1" class="rounded-full w-[500px] h-[500px] red-gradient"></div> -->
					<div class="overflow-hidden w-[400px] h-[400px] absolute top-[50px] left-[50px] rounded-full">
						<img src="/img/carnet/png/20240419112115 33-1.png" alt="Juliette Villars" class="absolute object-cover scale-[2] top-60 right-32" loading="lazy"/>
					</div>
				</div>
				<div class="relative col-span-1">
					<div id="circle-2" class="rounded-full w-[500px] h-[500px] bg-gradient-to-l bg-transparent"></div>
					<div class="overflow-hidden w-[400px] h-[400px] absolute top-[50px] left-[50px] rounded-full">
						<img src="/img/carnet/png/20240419112115 34-1.png" alt="Juliette Villars" class="absolute object-cover scale-[2] top-72 left-52" loading="lazy"/>
					</div>
				</div>
				<div class="relative col-span-1">
					<!-- <div id="circle-3" class="rounded-full w-[500px] h-[500px] bg-gradient-to-r from-[#4a8783] to-[#fcfae7]"></div> -->
					<div class="overflow-hidden w-[400px] h-[400px] absolute top-[50px] left-[50px] rounded-full">
						<img src="/img/carnet/png/20240419112115 35-1.png" alt="Juliette Villars" class="absolute object-cover scale-[3] -bottom-20 left-4" loading="lazy"/>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<style>
	
	.red-gradient{
		background: rgb(252,250,231);
		background: radial-gradient(circle, rgba(252,250,231,1) 0%, rgba(222,193,150,1) 25%, rgba(242,87,23,1) 73%);
	}
@keyframes float1 {
	0% {
		transform: translateY(0px) translateX(0px);
	}
	25% {
		transform: translateY(-10px) translateX(10px);
	}

	50% {
		transform: translateY(20px) translateX(0);
	}
	100% {
		transform: translateY(0px) translateX(0px);
	}
}

@keyframes float2 {
	0% {
		transform: translateY(0px) translateX(0px);
	}
	25% {
		transform: translateY(5px) translateX(-15px);
	}

	50% {
		transform: translateY(-5px) translateX(-5px);
	}
	100% {
		transform: translateY(0px) translateX(0px);
	}
}

@keyframes float3 {
	0% {
		transform: translateY(0px) translateX(0px);
	}
	25% {
		transform: translateY(-10px) translateX(10px);
	}

	50% {
		transform: translateY(20px) translateX(0);
	}
	100% {
		transform: translateY(0px) translateX(0px);
	}
}

.second-section .img-container {
	animation: float 6s ease-in-out infinite;
}

.floating1 {
	animation: float1 20s ease-in-out infinite;
}

.floating2 {
	animation: float2 20s ease-in-out infinite;
}

.floating3 {
	animation: float3 20s ease-in-out infinite;
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


    h1, h2 {
        font-family: 'Hatolie', sans-serif;
    }
</style>
