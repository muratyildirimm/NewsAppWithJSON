
import Foundation

class Webservice {
  func downloadNews(url: URL, completion: @escaping ([New]?) -> ()) {
    URLSession.shared.dataTask(with: url) { (data, response, error) in
      if let error = error {
        print(error.localizedDescription)
        completion(nil)
      } else if let data = data {
       let newsArray = try? JSONDecoder().decode([New].self, from: data)
        guard let newsArray = newsArray else { return }
        completion(newsArray)
      }
    }.resume()
  }
}
