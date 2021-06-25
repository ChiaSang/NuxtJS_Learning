<template>
  <b-container fluid class="nav-m shadow bg-white rounded">
    <b-navbar variant="faded" type="light">
      <a class="navbar-brand" href="/">
        <b-icon icon="battery-full" style="color: #41b883"></b-icon>
        BaseWeb
      </a>
      <ul class="navbar-nav bd-navbar-nav flex-row ml-auto" variant="primary">
        <li class="nav-item mx-4">
          <NuxtLink class="nav-link" to="/">主页</NuxtLink>
        </li>
        <li class="nav-item mx-4">
          <NuxtLink class="nav-link" to="/charts">图表</NuxtLink>
        </li>
        <li class="nav-item mx-4">
          <NuxtLink class="nav-link" to="/items">类目</NuxtLink>
        </li>
        <li class="nav-item mx-4">
          <NuxtLink class="nav-link" to="/my">我的</NuxtLink>
        </li>
        <li class="nav-item mx-4">
          <NuxtLink class="nav-link" to="/monitor">大屏</NuxtLink>
        </li>
      </ul>
    </b-navbar>
  </b-container>
</template>

<style scoped>
.nav-m {
  margin-bottom: 3rem;
}
.navbar-brand {
  color: #2f495e;
}
</style>
