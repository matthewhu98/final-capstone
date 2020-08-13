<template>
  <div>
    <div
      class="itinerary-name itinerary-title-color"
      v-bind:value="getItineraryName(this.itineraryID)"
    >{{this.name}}</div>
    <router-link class="add-more-lands" v-bind:to="{ name: 'the-landmarks'}">Add More Attractions</router-link>
    <div class="IT-Container">
      <!-- <router-link
              class="title-home-page button"
              v-bind:to="{ name: 'the-landmarks'}"
      >Landmarks</router-link>-->

      <div
        class="objects container-panel"
        v-for="landmark in this.$store.state.landmarksInItinerary"
        v-bind:key="landmark.landmarkID"
      >
        <!-- <h1>{{landmark.name}}</h1> -->
        <div class="object">
          <div class="img-container">
            <img class="single-image-IT" v-bind:src="getImageUrl(landmark.img)">
            <div class="land-title">{{landmark.name}}</div>

            <div>
              <button
                class="delete-land-button"
                v-bind:id="landmark.landmarkID"
                v-on:click="deleteLand(landmark.landmarkID)"
              >
                <i class="fas fa-trash-alt fa-2x"></i>
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="page-footer"></div>
  </div>
</template>

<script>
import LandmarkService from "@/services/LandmarkService";
export default {
  name: "itinerary-details",
  image: "getImageUrl(landmark.img)",
  props: {
    itineraryID: Number
  },
  data() {
    return {
      name: "",
      itineraryLandmark: {
        itineraryId: this.itineraryID,
        landmarkId: 0
      }
    };
  },

  methods: {
    getImageUrl(pic) {
      return require("@/assets/" + pic);
    },
    getItinerary(userId) {
      LandmarkService.getItinerary(userId).then(response => {
        this.$store.commit("SET_ITINERARIES", response.data);
      });
    },
    getItineraryName(id) {
      this.$store.state.itineraries.map(single => {
        if (single.itineraryID === id) {
          this.name = single.name;
        }
      });
    },
    reloadPage() {
      window.location.reload();
    },

    deleteLand(lId) {
      this.itineraryLandmark.landmarkId = lId;
      LandmarkService.deleteLandmarkInItinerary(
        this.itineraryID,
        this.itineraryLandmark
      )
        .then(response => {
          if (response.status === 200) {
            this.reloadPage();
          }
        })
        .catch(error => {
          if (error.response.status === 404) {
            this.$router.push("/not-found");
          }
        });
    }
  },
  created() {
    LandmarkService.getItineraryDetails(this.itineraryID).then(response => {
      this.$store.commit("SET_LANDMARKS_IN_ITINERARY", response.data);
    });
    this.getItinerary(this.$store.state.user.id);
  }
};
</script>

<style>

.IT-Container {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(20rem, 1fr));
  grid-gap: 2rem;
  max-width: 80rem;
  margin: auto;
  padding: 10 5rem;
}
.single-image-IT {
  --size: 400px;
  height: calc(var(--size) * 1.3);
  width: var(--size);
  object-fit: cover;
  border-radius: none;
  background-image: var(--img);
  background-size: cover;
  background-repeat: no-repeat;
  border: 1.2rem solid white;
  border-bottom: 4rem solid white;
}
.img-container {
  color: white;
  filter: grayscale(100%);
  font-family: "Open Sans", sans-serif;
}
.img-container:hover {
  filter: grayscale(0%);
  filter: drop-shadow(10px 10px 10px rgba(0, 0, 0, 0.5));
  transform: scale(1.02);
}
.land-title {
  color: black;
  text-decoration: none;
  font-size: 20px;
  position: relative;
  bottom: 60px;
  z-index: 3;
  font-family: "Rock Salt", cursive;
}

.itinerary-name {
  font-family: "Poiret One", cursive;
    filter: drop-shadow(5px 5px 5px black);
  font-size: 5vw;
  padding: 120px 0 30px 0;;
}

.fa-trash-alt:hover {
  color: #d50102;
}

.delete-land-button {
  border: none;
  background: none;
  color: black;
  position: relative;
  bottom: 96px;
  left: 160px;
  z-index: 10;
}

.add-more-lands {
  color: #b18f69;
  text-transform: uppercase;
  font-size: 20px;
  padding: 15px;
  margin-bottom: 30px;
  display: inline-block;
  text-decoration: none;
  border: none;
  background: white;
  border-radius: 4px;
}

.add-more-lands:hover {
  background: #5ba1b0;
  color: white;
  -webkit-transition: all 0.3s;
  -moz-transition: all 0.3s;
  -ms-transition: all 0.3s;
  -ms-transition: all 0.3s;
  transition: all 0.3s;
  backface-visibility: hidden;
  -webkit-backface-visibility: hidden;
  /* Chrome and Safari */
  -moz-backface-visibility: hidden;
  /* Firefox */
  -ms-backface-visibility: hidden;
  /* Internet Explorer */
}

.page-footer {
  height: 50px;
}
.itinerary-title-color {
  color: white;
}
</style>