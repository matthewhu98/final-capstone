<template >
  <div class="landmark-explained">
    <link
      href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Nanum+Pen+Script&display=swap"
      rel="stylesheet"
    >

    <!-- <div class="page-grid"> -->
    <div class="container">
      <div class="st-container">
        <input type="radio" name="radio-set" checked="checked" id="st-control-1">
        <a href="#st-panel-1">
          <h2 class="title">{{this.$store.state.activeLandmark.name}}</h2>
        </a>

        <input type="radio" name="radio-set" id="st-control-2">
        <a href="#st-panel-2">
          <h2 class="title">Photos</h2>
        </a>

        <input type="radio" name="radio-set" id="st-control-3">
        <a href="#st-panel-3">
          <h2 class="title">Summary</h2>
        </a>

        <input type="radio" name="radio-set" id="st-control-4">
        <a href="#st-panel-4">
          <h2 class="title">Map</h2>
        </a>

        <input type="radio" name="radio-set" id="st-control-5">
        <a href="#st-panel-5">
          <h2 class="title">Add to Itinerary</h2>
        </a>

        <div class="st-scroll">
          <!-- Placeholder text from http://hipsteripsum.me/ -->

          <section class="st-panel" id="st-panel-1">
            <!-- <div class="st-deco" data-icon></div> -->
            <h2>
              <h1 class="title landmark-name">{{this.$store.state.activeLandmark.name}}</h1>
            </h2>
            <p class="tagline">{{this.$store.state.activeLandmark.summery}}</p>
            <img class="main-image" v-bind:src="getImageUrl(this.$store.state.activeLandmark.img)">
          </section>

          <section class="st-panel st-color" id="st-panel-2">
            <div data-icon></div>
            <!-- <img class="main-image" v-bind:src="getImageUrl(this.$store.state.activeLandmark.img)" /> -->
            <div class="collection">
              <div
                class="gallery"
                v-for="singleImg in this.$store.state.activeLandmark.moreImgs"
                v-bind:key="singleImg.id"
              >
                <img class="single-in-gallery-image" v-bind:src="getImageUrl(singleImg)">
              </div>
            </div>
          </section>

          <section class="st-panel" id="st-panel-3">
            <div data-icon></div>
            <h2 class="title">{{this.$store.state.activeLandmark.name}}</h2>
            <p class="description">{{this.$store.state.activeLandmark.discription}}</p>
          </section>

          <section class="st-panel st-color" id="st-panel-4">
            <div data-icon></div>
            <div class="map">
              <iframe
                v-bind:src="getMap()"
                width="800"
                height="500"
                frameborder="0"
                style="border:0;"
                allowfullscreen
                aria-hidden="false"
                tabindex="0"
              ></iframe>
            </div>
          </section>

          <section class="st-panel" id="st-panel-5">
            <h2>Add to Itinerary</h2>
            <button
              class="button-itinerary"
              v-on:click="showListOfItineraries = !showListOfItineraries"
            >{{showListOfItineraries === true ? "Done": "Add to Trips"}}</button>
            <div class="itTable">
              <div v-show="showListOfItineraries">
                <div
                  v-for="itinerary in this.$store.state.itineraries"
                  v-bind:key="itinerary.itineraryID"
                >
                  <div>{{itinerary.name}}</div>
                  <div>
                    <input
                      type="checkbox"
                      class="checkbox"
                      v-bind:id="itinerary.itineraryID"
                      v-on:click="addLandmarkToIt(itinerary.itineraryID)"
                    >
                  </div>
                </div>
              </div>
            </div>
            <div class="button-and-menu"></div>
          </section>
        </div>
        <!-- // st-scroll -->
      </div>
      <!-- // st-container -->

      <!-- </div> -->
      <!-- <h1 class="title">{{this.$store.state.activeLandmark.name}}</h1>
                <p class="description">{{this.$store.state.activeLandmark.discription}}</p>

                
                <img class="main-image" v-bind:src="getImageUrl(this.$store.state.activeLandmark.img)">
                
                <p class="map"> <iframe v-bind:src="getMap()" width="450" height="250" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe></p>

                
                  <button class="button-itinerary button"
                    v-on:click="showListOfItineraries = !showListOfItineraries">{{showListOfItineraries === true ? "Cancel": "Add to Itineraries"}}</button>
                
                      <tr class="itTable" v-show="showListOfItineraries">
                        <div v-for="itinerary in this.$store.state.itineraries" v-bind:key="itinerary.itineraryID">
                          <td>{{itinerary.name}}</td>
                        <td>
                          <input type="checkbox" v-bind:id="itinerary.itineraryID" v-on:click="addLandmarkToIt(itinerary.itineraryID)"/>
                        </td>
                        </div>
      </tr>-->

      <!-- <div class= "card-gallery">
                    <div class="gallery gallery cf" v-for="singleImg in this.$store.state.activeLandmark.moreImgs" v-bind:key="singleImg.id">
                        <img class="single-in-gallery-image" v-bind:src="getImageUrl(singleImg)">
                  </div>
      </div>-->
    </div>
  </div>
</template>

<script>
import LandmarkService from "@/services/LandmarkService";
export default {
  name: "landmark-details",
  image: "getImageUrl(this.$store.state.activeLandmark.img)",
  props: {
    landmarkID: Number
  },
  data() {
    return {
      itineraryLandmark: {
        landmarkId: this.landmarkID,
        itineraryId: 0
      },

      showListOfItineraries: false
    };
  },

  methods: {
    getImageUrl(pic) {
      return require(`@/assets/${pic}`);
    },
    getItinerary(userId) {
      LandmarkService.getItinerary(userId).then(response => {
        this.$store.commit("SET_ITINERARIES", response.data);
      });
    },

    addLandmarkToIt(id) {
      this.itineraryLandmark.itineraryId = id;
      LandmarkService.addLandmarkToItinerary(
        this.landmarkID,
        this.itineraryLandmark
      )
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
    },

    getMap() {
      return this.$store.state.activeLandmark.mapLink;
    }

    // }
    // actionButtonDisabled(){
    //     if(this.itineraryLandmark.itineraryId !== 0){
    //       alert("This Landmark Already Exists In Your Trip ");
    //     }
    //   },
  },
  created() {
    LandmarkService.getLandmark(this.landmarkID).then(response => {
      this.$store.commit("SET_ACTIVE_LANDMARK", response.data);
    });
    this.getItinerary(this.$store.state.user.id);
  }
  //     computed: {
  //   backgroundURL: getImageUrl() {
  //     return 'url(this.$store.state.activeLandmark.img)';
  //   }

  // }
};
</script>

<style  lang="css" scoped>
body {
  overflow: hidden;
}

a {
  text-decoration: none;
}

.landmark-name {
  font-size: 80px;
  font-family: "Poiret One", cursive;
  filter: drop-shadow(5px 5px 5px black);
}

.tagline {
  text-align: center !important;
  color: #494949 !important;
  font-size: 30px;
  text-transform: uppercase;
  font-family: "Open Sans", sans-serif;
  margin: 30px;
}

.main-image {
  position: relative;
  background-repeat: no-repeat;
  background-attachment: fixed;
  max-width: 100%;
  height: auto;
  background-size: cover;
}

.st-container {
  position: absolute;
  width: 100%;
  height: 100%;
}

.st-container > input,
.st-container > a {
  position: fixed;
  bottom: 0px;
  width: 20%;
  cursor: pointer;
  font-size: 14px;
  font-family: "Open Sans", sans-serif;
  text-transform: uppercase;
  height: 34px;
  line-height: 34px;
}

.st-container > input {
  opacity: 0;
  z-index: 1000;
}

.st-container > a {
  z-index: 10;
  font-weight: 700;
  background: white;
  color: #494949;
  text-align: center;
}

/* "Fix" for percentage rounding: add a background bar pseudo element with the same color like the labels */
.st-container:before {
  content: "";
  position: fixed;
  width: 100%;
  height: 34px;
  background: #4e9eb0;
  z-index: 9;
  bottom: 0;
}

#st-control-1,
#st-control-1 + a {
  left: 0;
}

#st-control-2,
#st-control-2 + a {
  left: 20%;
}

#st-control-3,
#st-control-3 + a {
  left: 40%;
}

#st-control-4,
#st-control-4 + a {
  left: 60%;
}

#st-control-5,
#st-control-5 + a {
  left: 80%;
}

.st-container > input:checked + a,
.st-container > input:checked:hover + a {
  background: #4e9eb0;
  color: white;
}

/* .st-container > input:checked + a:after,
.st-container > input:checked:hover + a:after {
  bottom: 100%;
  border: solid transparent;
  content: "";
  height: 0;
  width: 0;
  position: absolute;
  pointer-events: none;
  border-bottom-color: #5ba1b0;
  border-width: 20px;
  left: 50%;
  margin-left: -20px;
} */

.st-container > input:hover + a {
  background: #dce2e1;
}

.st-container > input:hover + a:after {
  border-bottom-color: #b18f69;
}

.st-scroll,
.st-panel {
  position: relative;
  width: 100%;
  height: 100%;
}

.st-scroll {
  top: 0;
  left: 0;
  -webkit-transition: all 0.6s ease-in-out;
  -moz-transition: all 0.6s ease-in-out;
  -o-transition: all 0.6s ease-in-out;
  -ms-transition: all 0.6s ease-in-out;
  transition: all 0.6s ease-in-out;

  /* Let's enforce some hardware acceleration */
  -webkit-transform: translate3d(0, 0, 0);
  -webkit-backface-visibility: hidden;
  backface-visibility: hidden;
  transform: translate3d(0, 0, 0);
}

.st-panel {
  overflow: hidden;
}

#st-control-1:checked ~ .st-scroll {
  -webkit-transform: translateY(0%);
  -moz-transform: translateY(0%);
  -o-transform: translateY(0%);
  -ms-transform: translateY(0%);
  transform: translateY(0%);
}
#st-control-2:checked ~ .st-scroll {
  -webkit-transform: translateY(-100%);
  -moz-transform: translateY(-100%);
  -o-transform: translateY(-100%);
  -ms-transform: translateY(-100%);
  transform: translateY(-100%);
}
#st-control-3:checked ~ .st-scroll {
  -webkit-transform: translateY(-200%);
  -moz-transform: translateY(-200%);
  -o-transform: translateY(-200%);
  -ms-transform: translateY(-200%);
  transform: translateY(-200%);
}
#st-control-4:checked ~ .st-scroll {
  -webkit-transform: translateY(-300%);
  -moz-transform: translateY(-300%);
  -o-transform: translateY(-300%);
  -ms-transform: translateY(-300%);
  transform: translateY(-300%);
}
#st-control-5:checked ~ .st-scroll {
  -webkit-transform: translateY(-400%);
  -moz-transform: translateY(-400%);
  -o-transform: translateY(-400%);
  -ms-transform: translateY(-400%);
  transform: translateY(-400%);
}

/* Content elements */

[data-icon]:after {
  content: attr(data-icon);

  color: #fff;
  position: absolute;
  width: 200px;
  height: 200px;
  line-height: 200px;
  text-align: center;
  font-size: 90px;
  font-family: "Poiret One", cursive;
  top: 50%;
  left: 50%;
  margin: -100px 0 0 -100px;
  -webkit-transform: rotate(-45deg) translateY(25%);
  -moz-transform: rotate(-45deg) translateY(25%);
  -o-transform: rotate(-45deg) translateY(25%);
  -ms-transform: rotate(-45deg) translateY(25%);
  transform: rotate(-45deg) translateY(25%);
}

.st-panel h2 {
  font-family: "Poiret One", cursive;
  color: white;
  position: absolute;
  font-size: 54px;
  font-weight: 900;
  width: 80%;
  left: 10%;
  text-align: center;
  z-index: 2;
  line-height: 50px;
  margin: -70px 0 0 0;
  padding: 0;
  top: 50%;
  -webkit-backface-visibility: hidden;
  backface-visibility: hidden;
}

#st-control-1:checked ~ .st-scroll #st-panel-1 h2,
#st-control-2:checked ~ .st-scroll #st-panel-2 h2,
#st-control-3:checked ~ .st-scroll #st-panel-3 h2,
#st-control-4:checked ~ .st-scroll #st-panel-4 h2,
#st-control-5:checked ~ .st-scroll #st-panel-5 h2 {
  -webkit-animation: moveDown 0.6s ease-in-out 0.2s backwards;
  -moz-animation: moveDown 0.6s ease-in-out 0.2s backwards;
  -o-animation: moveDown 0.6s ease-in-out 0.2s backwards;
  -ms-animation: moveDown 0.6s ease-in-out 0.2s backwards;
  animation: moveDown 0.6s ease-in-out 0.2s backwards;
}

#st-panel-2 {
  padding: 160px 60px 60px 60px;
}

@-webkit-keyframes moveDown {
  0% {
    -webkit-transform: translateY(-40px);
    opacity: 0;
  }
  100% {
    -webkit-transform: translateY(0px);
    opacity: 1;
  }
}

@-moz-keyframes moveDown {
  0% {
    -moz-transform: translateY(-40px);
    opacity: 0;
  }
  100% {
    -moz-transform: translateY(0px);
    opacity: 1;
  }
}

@-o-keyframes moveDown {
  0% {
    -o-transform: translateY(-40px);
    opacity: 0;
  }
  100% {
    -o-transform: translateY(0px);
    opacity: 1;
  }
}

@-ms-keyframes moveDown {
  0% {
    -ms-transform: translateY(-40px);
    opacity: 0;
  }
  100% {
    -ms-transform: translateY(0px);
    opacity: 1;
  }
}

@keyframes moveDown {
  0% {
    transform: translateY(-40px);
    opacity: 0;
  }
  100% {
    transform: translateY(0px);
    opacity: 1;
  }
}

.st-panel p {
  position: absolute;
  text-align: left;
  line-height: 40px;
  color: #797979;
  border-radius: 3px;
  background: rgba(255, 255, 255, 0.8);
  z-index: 2;
  padding: 10px;
  width: 50%;
  left: 25%;
  top: 50%;
  margin: 10px 0 0 0;
  -webkit-backface-visibility: hidden;
  backface-visibility: hidden;
}
#st-control-1:checked ~ .st-scroll #st-panel-1 p,
#st-control-2:checked ~ .st-scroll #st-panel-2 p,
#st-control-3:checked ~ .st-scroll #st-panel-3 p,
#st-control-4:checked ~ .st-scroll #st-panel-4 p,
#st-control-5:checked ~ .st-scroll #st-panel-5 p {
  -webkit-animation: moveUp 0.6s ease-in-out 0.2s backwards;
  -moz-animation: moveUp 0.6s ease-in-out 0.2s backwards;
  -o-animation: moveUp 0.6s ease-in-out 0.2s backwards;
  -ms-animation: moveUp 0.6s ease-in-out 0.2s backwards;
  animation: moveUp 0.6s ease-in-out 0.2s backwards;
}

@-webkit-keyframes moveUp {
  0% {
    -webkit-transform: translateY(40px);
    opacity: 0;
  }
  100% {
    -webkit-transform: translateY(0px);
    opacity: 1;
  }
}

@-moz-keyframes moveUp {
  0% {
    -moz-transform: translateY(40px);
    opacity: 0;
  }
  100% {
    -moz-transform: translateY(0px);
    opacity: 1;
  }
}

@-o-keyframes moveUp {
  0% {
    -o-transform: translateY(40px);
    opacity: 0;
  }
  100% {
    -o-transform: translateY(0px);
    opacity: 1;
  }
}

@-ms-keyframes moveUp {
  0% {
    -ms-transform: translateY(40px);
    opacity: 0;
  }
  100% {
    -ms-transform: translateY(0px);
    opacity: 1;
  }
}

@keyframes moveUp {
  0% {
    transform: translateY(40px);
    opacity: 0;
  }
  100% {
    transform: translateY(0px);
    opacity: 1;
  }
}

/* Colored sections */

.st-color {
  background: #5ba1b0;
}
.st-color [data-icon]:after {
  color: #d8caae;
}
.st-color {
  background: #d8caae;
}
.st-color h2 {
  color: #d8caae;
}
.st-color p {
  color: #d8caae;
  color: #dce2e1;
}

@media screen and (max-width: 520px) {
  .st-panel h2 {
    font-size: 42px;
  }

  .st-panel p {
    width: 90%;
    left: 5%;
    margin-top: 0;
  }

  .st-container > a {
    font-size: 13px;
  }
}
@media screen and (max-width: 360px) {
  .st-container > a {
    font-size: 10px;
  }

  [data-icon]:after {
    font-size: 60px;
    -webkit-transform: rotate(-45deg) translateY(15%);
    -moz-transform: rotate(-45deg) translateY(15%);
    -o-transform: rotate(-45deg) translateY(15%);
    -ms-transform: rotate(-45deg) translateY(15%);
    transform: rotate(-45deg) translateY(15%);
  }
}

/* .page-grid{
  display: grid;
  grid-template-columns: 0.7fr 1fr 1fr 1fr 1fr 0.7fr;
  grid-template-areas:
  ". . title title ITbtn ."
  ". main-image main-image description description ."
  ". main-image main-image map map ."
  ". main-image main-image map map ."
  ". . . . . .";
  grid-gap: 25px;
  /* margin: 35px; */

/*   
}  */

/* .main-image {
   width: 100%;
  height: auto;
  
  grid-area: main-image;
  border:white solid 25px 10px 0 10px;
} */

/* .title {
  
  font-size: 70px;
  grid-area: title;
  
} */
.map {
  position: center;
  padding-top: 160px;
}

.button-and-menu {
  align-content: center !important;
  margin-top: 120px;
  position: center;
}

.itTable {
  margin: 60px;
  align-self: center !important;
  font-size: 30px;
  margin-top: 25vh;
  text-transform: uppercase;
}


.checkbox {
  margin-bottom:40px;
}

.button-itinerary {
  margin-top: 22vh;
  z-index: 1;
  color: #b18f69;
  text-transform: uppercase;
  font-size: 20px;
  padding: 15px;
  text-decoration: none;
  border: none;
  background: white;
  border-radius: 4px;
}

.button-itinerary:hover {
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

.gallery {
  display: grid;
  position: relative;
  align-content: center;
  float: left;
  width: 250px;
  transition: 0.1s transform;
  transform: translateZ(0);
  margin: 0 10px 45px 10px;
}

h1 {
  grid-area: h1;
}

.collection {
  padding-left: 200px;
}

.single-in-gallery-image {
  height: 225px;
  width: 225px;
  object-fit: cover;
  border: 0.5rem solid white;
  border-radius: 3px;
  background-image: var(--img);
  background-size: cover;
  background-repeat: no-repeat;
  transition: transform 200ms ease-out;
}

.single-in-gallery-image:hover {
  transform: scale(1.3);
  filter: drop-shadow(10px 10px 10px rgba(0, 0, 0, 0.6));
}

</style>