<template >
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
      <img class="single-image" v-bind:src="getImageUrl(this.$store.state.activeLandmark.img)" />
    </div>
  </div>
</template>

<script>
import LandmarkService from "../services/LandmarkService";
export default {
  name: "landmark-details",
  image: "getImageUrl(this.$store.state.activeLandmark.img)",
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
/* body{
  background-image: image;
} */
.single-image {
  height: 40rem;
  margin: 2rem;
}

.title {
  font-family: "Nanum Pen Script", cursive;
  font-size: 70px;
}

.description {
  font-family: "Nanum Gothic", sans-serif;
  font-size: 45px;
  border: 1px solid saddlebrown;
  margin: 3rem;
  padding: 2rem;
}

.landmark-explained {
  color: black;
  display: flex;
  flex-direction: row;
  justify-content: space-around;
}
</style>