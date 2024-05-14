<script>
    import { MasonryInfiniteGrid, JustifiedInfiniteGrid, PackingInfiniteGrid, FrameInfiniteGrid } from "@egjs/svelte-infinitegrid";
  
    let items = getItems(0, 42);
  
    function getItems(nextGroupKey, count) {
      const nextItems = [];
  
      for (let i = 0; i < count; ++i) {
        const nextKey = nextGroupKey * count + i;
  
        nextItems.push({ groupKey: nextGroupKey, key: nextKey });
      }
      return nextItems;
    }

    function scrollToTop(){

		document.getElementById('top').scrollIntoView({behavior: "smooth"});
	}

  </script>
  
  <div class="w-full flex justify-center items-center py-40">
    <button type="button" id="top">TOP </button>    
    <JustifiedInfiniteGrid
        class="container"
        columnRange={[1, 6]}
        data
        gap={40}
        {items}
        on:requestAppend={({ detail: e }) => {
        const nextGroupKey = (+e.groupKey || 0) + 1;
    
        items = [...items, ...getItems(nextGroupKey, 10)];
        }}
        let:visibleItems
    >
        {#each visibleItems as item (item.key)}
        {@const srcImg = `\\img\\carnet\\png\\20240419112115 ${(item.key) + 2}-1.png`}
        <div class="item">
            <div class="thumbnail">
            <img
                class="hover:scale-105"
                src={srcImg}
                alt="egjs" 
            />
            </div>
            <!-- <div class="info">{`egjs ${item.key}`}</div> -->
        </div>
        {/each}
    </JustifiedInfiniteGrid>

    <button on:click={scrollToTop} type="button" class="bg-putty-200 bounce hover:bg-putty-100 mt-auto mb-20 w-32 h-32 rounded-full border border-putty-800 flex justify-center items-center">
        <i class="fas fa-arrow-up fa-2x"></i>
    </button>
</div>