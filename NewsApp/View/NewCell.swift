
import UIKit

class NewCell: UITableViewCell {
  // MARK: IBOutlet
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var storyLabel: UILabel!
  override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
