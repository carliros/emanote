<apply template="base">
  <bind tag="body-main">
    <div class="container mx-auto">
      <!-- Header row-->
      <div class="grid grid-cols-12 md:px-2">
        <!-- Logo column -->
        <div class="hidden md:mr-4 md:block md:col-span-3">
          <div class="flex items-end h-full pl-2 mt-2 space-x-2">
            <a href="">
              <ema:metadata>
                <with var="template">
                  <img class="z-50 h-20 transition transform hover:scale-125 hover:opacity-80"
                    src="${value:iconUrl}" />
                </with>
              </ema:metadata>
            </a>
          </div>
        </div>
        <!-- Title column -->
        <div class="col-span-12 md:col-span-9">
          <apply template="components/breadcrumbs" />
        </div>
      </div>

      <!-- Main row-->
      <div class="grid grid-cols-12 px-2">
        <!-- Sidebar column -->
        <nav
          class="hidden overflow-x-auto md:mr-4 md:block md:col-span-3 md:sticky md:top-0 md:h-screen">
          <div class="flex flex-row float-right p-2 space-x-2 text-gray-500">
            <a href="@tags" title="View tags">
              <svg class="w-4 h-4 hover:text-${theme}-700" fill="none" stroke="currentColor"
                viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                  d="M7 7h.01M7 3h5c.512 0 1.024.195 1.414.586l7 7a2 2 0 010 2.828l-7 7a2 2 0 01-2.828 0l-7-7A1.994 1.994 0 013 12V7a4 4 0 014-4z">
                </path>
              </svg>
            </a>
            <a href="@index" title="Expand full tree">
              <svg class="w-4 h-4 hover:text-${theme}-700" fill="none" stroke="currentColor"
                viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                  d="M4 8V4m0 0h4M4 4l5 5m11-1V4m0 0h-4m4 0l-5 5M4 16v4m0 0h4m-4 0l5-5m11 5l-5-5m5 5v-4m0 4h-4">
                </path>
              </svg>
            </a>
          </div>
          <div class="pt-1 pb-2 rounded bg-${theme}-50 border-2 border-${theme}-200 shadow-inner">
            <ema:route-tree>
              <apply template="components/sidebar-tree" />
            </ema:route-tree>
          </div>
        </nav>
        <!-- Main body column -->
        <div class="col-span-12 md:col-span-9">
          <main>
            <article class="overflow-auto">
              <apply template="components/pandoc" />
            </article>
            <apply template="components/backlinks" />
            <apply template="components/metadata" />
          </main>
          <apply template="components/footer" />
        </div>
      </div>
    </div>
  </bind>
</apply>