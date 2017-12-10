import Quick
import Nimble
@testable import StoryboardStaticTVCTesting

class WiringSpec: QuickSpec {
    override func spec() {
        describe("sample table view controller") {
            context("when accessing cells directly based on their section and row") {
                it("can access the contents of the first cell") {
                    let tableVC = UIStoryboard.main.instantiateViewController(
                        withIdentifier: "SampleTableViewController"
                    ) as? SampleTableViewController
                    tableVC?.configureForTesting()


                    let firstCell = tableVC?.tableView(
                        (tableVC?.tableView)!,
                        cellForRowAt: IndexPath(row: 0, section: 0)
                    )


                    expect(firstCell?.textLabel?.text).to(equal("First cell"))
                    expect(firstCell?.detailTextLabel?.text).to(equal("A"))
                }
            }

            context("when de-coupling the tests to the implementation") {
                it("contains a cell with the specified text") {
                    let tableVC = UIStoryboard.main.instantiateViewController(
                        withIdentifier: "SampleTableViewController"
                    ) as? SampleTableViewController
                    tableVC?.configureForTesting()


                    let allCellsLabelText = tableVC?.tableView.allCellsLabelText()


                    expect(allCellsLabelText).to(contain("Setting #2"))
                    expect(allCellsLabelText).toNot(contain("Setting #4"))
                }
            }
        }
    }
}

extension UITableView {
    func allCellsLabelText() -> [String] {
        var labelTexts: [String] = []

        for section in 0..<self.numberOfSections {
            for row in 0..<self.numberOfRows(inSection: section) {
                let indexPath = IndexPath(row: row, section: section)
                let cell = cellForRow(at: indexPath)
                labelTexts.append((cell?.textLabel?.text)!)
            }
        }

        return labelTexts
    }
}

extension UIStoryboard {
    static var main: UIStoryboard {
        get {
            return UIStoryboard(name: "Main", bundle: Bundle.main)
        }
    }
}

extension UIViewController {
    func configureForTesting() {
        let _ = view
    }
}
