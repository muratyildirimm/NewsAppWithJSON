
import UIKit

class ViewController: UIViewController {
  // MARK: IBOutlet
  @IBOutlet weak var tableView: UITableView!
  // MARK: Variable
  private var newsTableViewModel: NewsTableViewModel!
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = UITableView.automaticDimension
    getData()
  }
  func getData() {
    let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/BTK-iOSDataSet/master/dataset.json")
    Webservice().downloadNews(url: url!) { (news) in
      guard let news = news else { return }
        self.newsTableViewModel = NewsTableViewModel(newList: news)
        DispatchQueue.main.async {
          self.tableView.reloadData()
        }
    }
  }
}

extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    newsTableViewModel == nil ? 0 : self.newsTableViewModel.numberOfRowsInSection()
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    UITableView.automaticDimension
  }
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NewCell
    let newViewModel = newsTableViewModel.newAtIndexPath(index: indexPath.row)
    cell.titleLabel.text = newViewModel.title
    cell.storyLabel.text = newViewModel.story
    return cell
  }
}
