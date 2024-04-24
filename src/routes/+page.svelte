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
		<div  class="grid grid-cols-3 gap-20 p-20 h-[850px] w-full relative">
			<!-- <div class="overflow-hidden relative rounded-lg">
				<img id="image_test_1" src="/img/carnet/png/20240419112115 32-1.png" alt="Juliette Villars " class="rounded-lg absolute" loading="lazy"/>
			</div> -->
			<div id="ara_rouge" class="overflow-hidden relative rounded-2xl shadow-[rgba(255,255,255,_0.4)_0px_0px_150px]">
				<img  src="/img/carnet/png/20240419112115 33-1.png" alt="Juliette Villars" class="" loading="lazy"/>
			</div>
			<div id="ara_vert" class="overflow-hidden relative rounded-2xl shadow-[rgba(255,255,255,_0.4)_0px_0px_150px]">
				<img  src="/img/carnet/png/20240419112115 34-1.png" alt="Juliette Villars" class="" loading="lazy"/>
			</div>
			<div id="motmot" class="overflow-hidden relative rounded-2xl shadow-[rgba(255,255,255,_0.4)_0px_0px_150px]">
				<img  src="/img/carnet/png/20240419112115 35-1.png" alt="Juliette Villars" class="" loading="lazy"/>
			</div>
		</div>
<!-- 
		<button on:click={scrollThirdSection} type="button" class="bg-putty-200 bounce hover:bg-putty-100 mt-auto mb-20 w-32 h-32 rounded-full border border-putty-800 flex justify-center items-center">
			<i class="fas fa-arrow-down fa-2x"></i>
		</button> -->
	</div>

	<div id="third-section" class="grid grid-cols-2 h-[1000px] w-full border-t border-2 border-putty-950  relative bg-putty-950">
		<button type="button" class="bg-gray-200 mt-20 p-5 absolute top-0 left-0" on:click={animateImages}>Animate</button>

		<div class="flex flex-col items-center text-sm py-10">
			<h3 class="text-9xl text-putty-100">Costa Rica</h3>
			<p class="max-w-md">
			</p>	
		</div>
		<div class="w-full h-full grid-cols-2 justify-center grid gap-20 relative overflow-hidden py-8 px-4 bg-putty-950">
			<div class="h-screen w-full relative overflow-hidden gradient" id="container">
				{#each Array(10) as _, i}
					{@const index_img = i+2}
					<img id="image_{i}" src="/img/carnet/png/20240419112115 {index_img}-1.png" alt="Juliette Villars" class="image absolute w-[280px] z-10 h-[360px] object-cover rounded-xl right-0" style:top="{i*380}px" loading="lazy"/>
				{/each}
			</div>
			<div class="h-screen w-full relative overflow-hidden gradient">
				{#each Array(10) as _, i}
					{@const index_img = i+12}

					<img id="image_{i}" src="/img/carnet/png/20240419112115 {index_img}-1.png" alt="Juliette Villars" class="image absolute w-[280px] z-10 h-[360px] object-cover rounded-xl left-0" style:top="{i*380}px" loading="lazy"/>
				{/each}
			</div>
		</div>
	</div>



	


</main>
<style>
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
