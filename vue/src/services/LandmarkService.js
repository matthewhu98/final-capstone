import axios from 'axios';

export default {

    list() {
      return axios.get('/landmarks');
    },

    getLandmark(id){
      return axios.get(`/landmarks/${id}`);
    },
    
    getItinerary(userId) {
      return axios.get(`/itineraries/${userId}`);
    },

    createItinerary(itinerary, userId){
      return axios.post(`/itineraries/${userId}` , itinerary);
    }
    // detail(id){
    //     return http.get(`/topics/${id}`)
    // }
  
  }