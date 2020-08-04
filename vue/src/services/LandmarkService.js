import axios from 'axios';

export default {

    list() {
      return axios.get('/landmarks');
    },

    getLandmark(id){
      return axios.get(`/landmarks/${id}`)
    }
    // detail(id){
    //     return http.get(`/topics/${id}`)
    // }
  
  }