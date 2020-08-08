<template >
  <div class="container">
    <link
      href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Nanum+Pen+Script&display=swap"
      rel="stylesheet"
    />
    <header>
      <div id="search">
        <label for="name">Where do you want to go?</label>
        <input type="text" v-model="this.filter.landmarkName" />
      </div>
      <router-link
        class="itinerary-route"
        v-bind:to="{name: 'itineraries' , params: {id: this.$store.state.user.id}}"
      >
        <i class="fas fa-clipboard-list"></i>
      </router-link>
    </header>

    <div class="card" v-for="landmark in this.$store.state.landmarks" v-bind:key="landmark.name">
      <div class="image-div">
        <router-link
          class="title"
          v-bind:to="{name: 'landmarkdetails' 
          , params: {id: landmark.landmarkID}}"
        >
          {{landmark.name}}
          <div class="circle">
            <img class="image" v-bind:src="getImageUrl(landmark.img)" />
          </div>
          <div></div>
        </router-link>
        <!-- <button v-on:click.prevent="getItinerary(this.$store.state.user.user_id)"></button> -->
      </div>
    </div>
  </div>
</template>

<script>
// import LandmarkDetails from "@/components/LandmarkDetails.vue";
import LandmarkService from "../services/LandmarkService";
export default {
  name: "landmark-list",
  data() {
    return {
      filter: {
        ladmarkName: "",
      },
    };
  },

  methods: {
    getLandmarks() {
      LandmarkService.list().then((response) => {
        this.$store.commit("SET_LANDMARKS", response.data);
      });
    },
    getImageUrl(pic) {
      return require("@/assets/" + pic);
    },
  },
  computed: {
    filterLandmark() {
      let filteredLocation = this.$store.state.landmarks;
      if (this.filter.ladmarkName != "") {
        filteredLocation = filteredLocation.filter((landmark) => {
          landmark.name
            .toLowerCase()
            .includes(this.filter.landmarkName.toLowerCase());
        });
      }
      return filteredLocation;
    },
  },

  created() {
    this.getLandmarks();
  },
};
</script>

<style>
/* body {
  background-color: #EDEAE5;

} */
.container {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr 1fr 1fr;
  grid-template-areas:
    "header header header route-button ."
    ". image image image ."
    ".image image image .";
}

#search {
}
.circle {
  /* border-radius: 50%; */
  /* height: 21rem;
  width: 21rem; */

  /* this is the line */

  border-radius: 5px 20px 5px;
  height: 30rem;
  width: 20rem;
  overflow: hidden;
  display: flex;
  justify-content: center;
  align-items: center;
}

.circle:hover {
  filter: drop-shadow(9px 9px 9px black);
}

.image:hover {
  height: 520px;

  /* height: 75%;
  width: 75%; */
  filter: grayscale(100%) blur(2px);
}

.image {
  height: 500px;
  border-radius: 5px 20px 5px;
  filter: contrast(120%);
}

.title {
  text-decoration: none;
  padding: 15px;
}

.card {
  font-family: "Nanum Gothic", sans-serif;
  /* font-size: 25px; */
  /* align-items: center; */
  display: block;
  padding: 15px;
}
.image-div {
 grid-area: image;
}
.itinerary-route {
  grid-area: route-button;
}

header {
  /* align-items: flex-start; */
  grid-area: header;
}
</style>