<template>
  <div class="title container">
    <div class="card">
      <h1>List of Landmarks in Rome</h1>
      <landmark-list class="landmark-card"></landmark-list>
    </div>
  </div>
</template>

<script>
import LandmarkList from "@/components/LandmarkList.vue";
export default {
  name: "the-landmarks",
  components: {
    LandmarkList
  }
};
</script>

<style>
.title {
  color: black;
}

.landmark-card {
  display: flex;
  flex-direction: row;
  justify-content: space-around;
}

/* .card {
  grid-area: card;
}

.container {
  display: grid;
  grid-template-columns: 0.5fr;
  grid-template-areas: card;
} */

/* body {
  background-image: url("~@/assets/backpack-image.jpg");
  background-position: top;
  background-size: 60rem 60rem;
  background-repeat: no-repeat;
  object-fit: cover;
} */
</style>