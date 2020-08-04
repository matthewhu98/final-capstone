<template>
  <div class="landmark-explained">
    <link
      href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Nanum+Pen+Script&display=swap"
      rel="stylesheet"
    />
    <div>
      <h1 class="title">{{this.$store.state.activeLandmark.name}}</h1>
      <p class="description">{{this.$store.state.activeLandmark.discription}}</p>
    </div>
    <div>
      <img class="image" v-bind:src="getImageUrl(this.$store.state.activeLandmark.img)" />
    </div>
  </div>
</template>

<script>
import LandmarkService from "../services/LandmarkService";
export default {
  name: "landmark-details",
  props: {
    landmarkID: Number
  },
  methods: {
    getImageUrl(pic) {
      return require("@/assets/" + pic);
    }
  },
  created() {
    LandmarkService.getLandmark(this.landmarkID).then(response => {
      this.$store.commit("SET_ACTIVE_LANDMARK", response.data);
    });
  }
};
</script>

<style>
.image {
  height: 43rem;
  padding: 5%;
}

.title {
  font-family: 'Nanum Pen Script', cursive;
  font-size: 70px;
}

.description {
    font-family: 'Nanum Gothic', sans-serif;
}

.landmark-explained {
  color: black;
  display: flex;
  flex-direction: row;
  justify-content: space-around;
}
</style>