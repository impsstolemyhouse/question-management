const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

const deleteAllData = async () => {
  try {
    // Delete all records in the dependent tables first
    await prisma.option.deleteMany();
    await prisma.step.deleteMany();
    await prisma.tag.deleteMany();

    // Delete all records in the main table
    await prisma.question.deleteMany();

    console.log("All data deleted successfully.");
  } catch (error) {
    console.error("Error deleting data:", error);
  } finally {
    await prisma.$disconnect();
  }
};

deleteAllData();
