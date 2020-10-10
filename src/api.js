import urlJoin from 'url-join';
import axios from 'axios';

class Api {
  static #baseUrl =
    window.location.hostname === 'localhost'
      ? 'http://localhost:5000'
      : 'https://my-domain.com/api';
  static #versionUrl = urlJoin(Api.#baseUrl, 'version');

  static async getVersion() {
    const res = await axios.get(Api.#versionUrl);
    return res.data;
  }
}

export default Api;
