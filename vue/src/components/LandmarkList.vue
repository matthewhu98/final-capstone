<template >
  <div class="container">
    <h1 class="list-of-landmarks">Popular Places to Visit</h1>

    <div id="search">
      <!-- <label for="name">Where do you want to go?</label> -->
      <input type="text" class="search-bar" placeholder="Where do you want to go?" v-model="name">
      <i class="fas fa-search"></i>
    </div>

    <div class="grid">
      <div
        class="objects container-panel"
        v-for="(landmark, index) in filterLandmark"
        v-bind:key="landmark.id"
      >
        <div class="object">
          <div class="card">
            <button class="button-itinerary button" v-on:click="landmarkToShow = index; ">
              <i class="fas fa-thumbtack"></i>
            </button>
            <div class="bring-forward">
              <tr class="itTable" v-show="landmarkToShow === index">
                <div class="itTable2">
                  <h3 class="your-itineraries">Your Itineraries</h3>
                  <div
                    ref="landmarkDetails"
                    v-for="itinerary in itineraries"
                    v-bind:key="itinerary.itineraryID"
                  >
                    <td>{{itinerary.name}}:</td>
                    <td>
                      <input
                        type="checkbox"
                        v-bind:id="itinerary.itineraryID"
                        v-on:click="addLandmarkToIt(itinerary.itineraryID, landmark.landmarkID)"
                      >
                    </td>
                  </div>
                </div>
              </tr>
            </div>

            <img @click="landmarkToShow=-1" class="image" v-bind:src="getImageUrl(landmark.img)">
            <router-link
              class="title"
              v-bind:to="{name: 'landmarkdetails', params: {id: landmark.landmarkID}}"
            >
              <h3>{{landmark.name}}</h3>
            </router-link>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import LandmarkService from "../services/LandmarkService";
export default {
  name: "landmark-list",
  data() {
    return {
      name: "",

      itineraryLandmark: {
        landmarkId: 0,
        itineraryId: 0
      },

      showListOfItineraries: false,
      landmarkToShow: -1,
      showButton: false
    };
  },

  methods: {
    getLandmarks() {
      LandmarkService.list().then(response => {
        this.$store.commit("SET_LANDMARKS", response.data);
      });
    },
    getImageUrl(pic) {
      return require("@/assets/" + pic);
    },
    addLandmarkToIt(id, lid) {
      this.itineraryLandmark.itineraryId = id;
      this.itineraryLandmark.landmarkId = lid;
      LandmarkService.addLandmarkToItinerary(lid, this.itineraryLandmark)
        .then(response => {
          if (response.status === 201) {
            alert("your landmark has been added");
          }
        })
        .catch(error => {
          if (error.response.status == 404) {
            this.$router.push("/not-found");
          }
        });
    }
  },
  computed: {
    filterLandmark() {
      return this.$store.state.landmarks.filter(landmark => {
        return this.name.toLowerCase() === ""
          ? true
          : landmark.name.toLowerCase().includes(this.name.toLowerCase());
      });
    },
    itineraries() {
      return this.$store.state.itineraries;
    }
  },

  created() {
    this.getLandmarks();
  }
};
</script>


<style lang="css" scoped>
@import url("https://fonts.googleapis.com/css2?family=Rock+Salt&display=swap");

.image {
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

.card {
  color: white;
  filter: grayscale(100%);
  font-family: "Open Sans", sans-serif;
}

.card:hover {
  filter: grayscale(0%);
  filter: drop-shadow(10px 10px 10px rgba(0, 0, 0, 0.5));
  transform: scale(1.02);
}

.search-bar {
  border: 2px solid white;
  border-radius: 10%;
  height: 1.5vw;
  width: 20vw;
  border-radius: var(--rad);
  transition: all var(--dur) var(--bez);
  transition-property: width, border-radius;
  height: 2.5vw;
  background-color: #b4c2c5;
  padding: 10px;
  margin: 20px;
  font-family: "Open Sans", sans-serif;
}

.grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(20rem, 1fr));
  grid-gap: 2rem;
  max-width: 80rem;
  margin: auto;
  padding: 10 5rem;
}

h1 {
  font-family: "Poiret One", cursive;
  font-size: 5vw;
  padding: 120px 0 30px 0;
  filter: drop-shadow(10px 10px 10px rgba(0, 0, 0, 0.6));
}

#search {
  font-size: 2vw;
  font-weight: bold;
  color: white;
}

.fa-search {
  position: relative;
  top: 8px;
}

.title {
  color: black;
  text-decoration: none;
  font-size: 20px;
  position: relative;
  bottom: 75px;
  z-index: 3;
  font-family: "Rock Salt", cursive;
}

.card:hover .title {
  color: #d50102;
}

.button-itinerary {
  color: #d50102;
  padding: 0.5rem;
  font-size: 15px;
  border: none;
  border-radius: 8px;
  position: relative;
  top: 3.7rem;
  left: 10rem;
  z-index: 5;
}

.bring-forward {
  margin: auto;
  position: absolute;
  top: 45%;
  -ms-transform: translateY(-50%);
  transform: translateY(-50%);
  left: 8rem;
  z-index: 2;
  background: rgba(0, 0, 0, 0.5);
}

.itTable2 {
  padding: 20px;
  overflow: hidden;
}

input {
  margin-left: 3px;
  margin-top: 1px;
}

.your-itineraries {
  border-bottom: 1px solid white;
  padding-bottom: 3px;
}
</style>