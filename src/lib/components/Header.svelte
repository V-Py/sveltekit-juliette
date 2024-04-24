
<script lang="ts">
    import {page} from '$app/stores';
</script>

<nav class="relative top-0 left-0 w-full pt-4 pb-8 bg-putty-50 text-gray-900 ">
    <div class="flex flex-wrap items-center justify-between w-full p-4 px-20">
        <a href="/" class="flex flex-col">
            <div class="tracking-wider font-bold text-xl text-putty-700">Juliette Villars</div>
            <div class="hidden md:block text-putty-600 italic text-sm">Carnettiste - Illustratrice</div>
        </a>
        <div class="hidden w-full md:block md:w-auto" id="navbar-default">
            <ul class="font-light flex flex-col p-4 md:p-0 mt-4 border border-gray-100 rounded-l md:flex-row md:space-x-8 rtl:space-x-reverse md:mt-0 md:border-0">
            <li>
                <a href="/" class:text-putty-700={$page.url.pathname == "/"} class:underline={$page.url.pathname == "/"} class="block py-2 px-3 text-gray-900 rounded md:bg-transparent md:p-0" aria-current="page">ACCUEIL</a>
            </li>
            <li>
                <a href="/shop" class:text-putty-700={$page.url.pathname == "/shop"} class:underline={$page.url.pathname == "/shop"} class="block py-2 px-3 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-putty-700 md:p-0  ">BOUTIQUE</a>
            </li>
            <li>
                <a href="/about" class:text-putty-700={$page.url.pathname == "/about"} class:underline={$page.url.pathname == "/about"} class="block py-2 px-3 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-putty-700 md:p-0 ">A PROPOS</a>
            </li>
            <li>
                <a href="/linktree" class:text-putty-700={$page.url.pathname == "/linktree"} class:underline={$page.url.pathname == "/linktree"}  class="block py-2 px-3 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-putty-700 md:p-0 ">LIENS</a>
            </li>
            <li>
                <a href="/contact" class:text-putty-700={$page.url.pathname == "/contact"} class:underline={$page.url.pathname == "/contact"} class="block py-2 px-3 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-putty-700 md:p-0 ">CONTACT</a>
            </li>
            </ul>
        </div>
    </div>
  </nav>
  