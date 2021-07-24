<template>
  <div class="container">
    <div>
      <Logo />
      <div class="header">高效、省时、可溯源！</div>
      <p class="snippet">数字驱动助力环保！</p>
      <!-- <p class="snippet">
        人并不是因为美丽才可爱，而是因为可爱才美丽。 ——托尔斯泰
      </p> -->
      <NuxtLink to="/login">
        <button class="button--green btn">现在注册 / 登入</button>
      </NuxtLink>
      <button variant="outline-dark" class="button--grey btn">了 解</button>
    </div>
    <!-- <img class="image" src="~assets/svg/fire-extinguisher.svg" alt="fire extinguisher"> -->
  </div>
</template>

<script>
export default {}
</script>

<style scoped>
.container {
  /* margin: auto; */
  /* min-height: 80vh; */
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: center;
  animation: 1s appear;
}

.Hero {
  height: 50vh;
  position: relative;
  display: flex;
  padding: 5rem 0;
  align-items: flex-start;
  /* justify-content: space-between; */
}

.text-container {
  width: 50%;
  margin-top: 2rem;
}

.header {
  color: #2f495e;
  font-weight: 900;
  font-size: 3rem;
  margin-top: 2rem;
}

.snippet {
  color: #606fa5;
  font-size: 1.25rem;
  margin-bottom: 3rem;
}

.image {
  width: 27.5rem;
  margin-top: 2rem;
}

.overlay {
  background: rgba(0, 0, 0, 0);
  position: absolute;
  width: 100%;
  height: 100%;
  top: 0;
}

.button {
  margin: 1rem 1rem;
  padding: 1rem 1rem;
  border-radius: 100rem;
  background-color: #41b883;
  color: white;
  /* width: 20rem; */
  font-weight: 700;
  transition: 0.5s;
  animation: 4s appear;
}

.button-light {
  margin: 1rem 1rem;
  padding: 1rem 1rem;
  border-radius: 100rem;
  /* width: 20rem; */
  font-weight: 700;
  transition: 0.5s;
  animation: 4s appear;
}

.button:hover {
  /* width: 10rem; */
  color: #41b883;
  background-color: white;
}

@media (max-width: 800px) {
  .Hero {
    height: 40vh;
  }
}
</style>