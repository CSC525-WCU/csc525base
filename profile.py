import geni.portal as portal
import geni.rspec.pg as pg
import geni.rspec.igext as IG

pc = portal.Context()

# Create a Request object to start building the RSpec.
request = portal.context.makeRequestRSpec()
# Create a XenVM
node = request.XenVM("node")
node.disk_image = "urn:publicid:IDN+emulab.net+image+emulab-ops:UBUNTU18-64-STD"
node.addService(pg.Execute(shell="sh", command="sudo bash /local/repository/install_rust.sh"))

# Print the RSpec to the enclosing page.
portal.context.printRequestRSpec()
