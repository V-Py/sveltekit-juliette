<script>
	import '../app.css';
	import '../fonts.css';
	import Footer from '$lib/components/Footer.svelte';
    import Header from '$lib/components/Header.svelte';
</script>

<!-- <div class="app relative w-full bg-putty-50"> -->
<div class="app relative w-full background-main">
	
	<Header />
	<main>
		<slot />
	</main>
	<Footer />
</div>

<style>
	.app {
		display: flex;
		flex-direction: column;
		min-height: 100vh;
	}

	.background-main{
		background-image: url("/img/background.png");
		background-repeat: no-repeat;
		background-position: center top;
		background-size: cover;
		/* padding-top: 180px; */
		/* padding-bottom: 318px; */
		position: relative;
		z-index: 800;
		/* margin-top: -115px; */
	}
</style>
