
import Foundation

struct NewsTableViewModel {
  let newList: [New]
}

extension NewsTableViewModel {
  func numberOfRowsInSection() -> Int {
    self.newList.count
  }
  
  func newAtIndexPath(index: Int) -> NewViewModel {
    let new = self.newList[index]
    return NewViewModel(new: new)
  }
}

struct NewViewModel {
  let new: New
  var title: String {
    return self.new.title
  }
  var story: String {
    return self.new.story
  }
}
